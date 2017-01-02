Drupal Docker Image
==================

[![Build Status](https://travis-ci.org/ausnimbus/docker-drupal.svg?branch=master)](https://travis-ci.org/ausnimbus/docker-drupal)
[![Licensed under Apache License version 2.0](https://img.shields.io/github/license/ausnimbus/docker-drupal.svg?maxAge=2592000)](https://www.apache.org/licenses/LICENSE-2.0)

This repository contains Dockerfile to run Drupal on AusNimbus (OpenShift v3).

Note: A volume is created in in the Drupal root directory. This image designed
to be a quickstart for deploying a fully functional Drupal installation.
It is not scalable unless you use a Read+Write+Many storage backend (such as NFS or GlusterFS).

Configuring
-----------

The image requires a linked MySQL service, we pre-configure a configuration file if the
the required environment variables are set.

- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD
- DATABASE_SERVICE_NAME

Drupal is installed into the /drupal sub directory. You change the document root by
setting the DOCUMENTROOT environment variable eg. /drupal

You can define the your Drupal version by setting the ENV variables.
The default Drupal version is 8.2.4

- DRUPAL_VERSION
- DRUPAL_MD5 (the sha1sum of the upstream .tar.gz)

A healthcheck file is created at /healthcheck.php which can be used for application healthchecks.

Running Locally
---------------

To build and run locally, execute:

    git clone https://github.com/ausnimbus/docker-drupal
    docker build -t drupal:ausnimbus .
    docker run -d drupal:ausnimbus
