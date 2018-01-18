Vagrant Docker Daemon
=====================

# Overview

Vagrant box with Docker daemon accessible from a remote host. Very useful for Docker image builds under a Windows based operating system.

# Features

* Create Ubuntu 14.04 base box with Vagrant
* Install Docker daemon with additional tools
* Open Docker daemon socket to use from a remote host
* Log DOCKER_HOST environment variable

# Prerequisites

* [Vagrant](https://www.vagrantup.com/docs/installation/) must be installed
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) must be installed

# Usage

* Create virtual machine with Vagrant:
  ```bash
  vagrant up
  ```

# Use case examples

## Windows

* Set DOCKER_HOST environment variable (use ip which is logged out by vagrant up):
  ```bash
  set DOCKER_HOST=tcp://172.28.128.2:2375
  ```  

* Use [docker-maven-plugin](https://dmp.fabric8.io/) from [fabric8](https://fabric8.io/) to build your Docker images:
  ```bash
  mvn clean install docker:build
  ```  

## Linux   

* Set DOCKER_HOST environment variable (use ip which is logged out by vagrant up):
  ```bash
  export DOCKER_HOST=tcp://172.28.128.2:2375
  ```  

* Use docker command line to test some features with a fresh installation:  
  ```bash
  docker run --rm hello-world
  ```  
