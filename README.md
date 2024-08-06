# ansible_osbuild

Use of ansible and the OSBuild collection to create and maintain an OSTree Web repository.

## Work in Progress

This repository is a work in progress and demonstrates the use of Ansible and the infra.osbuild collection to maintain Web Based OSTree repositories and generate ISO installers.

## Requirements

Tested With the following:

Ansible Core 2.15.10

### Ansible Collections:

infra.osbuild 2.3.0  
redhat.rhel_system_roles 1.23.0  

NOTE:  The infra.osbuild.builder role does not support the fips customization for ISO Installers in this version of the collection.  I have submitted a PR that has been merged upstream at [infra.osbuild Pull 403](https://github.com/redhat-cop/infra.osbuild/pull/403).
