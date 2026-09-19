# Ansible Configuration Management

This project introduces configuration management with Ansible.

The goal is to configure and manage an Ubuntu 22.04 sandbox from an Ansible control node. Instead of making changes manually on the server, Ansible describes the desired configuration in version-controlled files and applies it consistently over SSH.

The project covers:

- running Ansible from a Docker-based control environment;
- defining hosts and groups in an Ansible inventory;
- testing connectivity to a managed server;
- using Ansible facts and ad-hoc commands;
- installing packages and managing files and services;
- using variables and Jinja2 templates;
- using handlers when configuration changes occur;
- checking idempotence by running playbooks repeatedly;
- validating Ansible configuration before applying it.

## Control Environment

The supplied control-node pack is used to provide a consistent Ansible environment.

The Docker image is built with Ansible Core 2.17.7 and the `ansible-lab` directory is mounted into the container as `/work`.

The control node connects to the Holberton Ubuntu sandbox over SSH.

```text
Local machine
     |
     v
Docker container
Ansible control node
     |
     | SSH
     v
Ubuntu 22.04 sandbox
Managed node
