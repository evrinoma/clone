# Clone

## Overview
This project provides functionality to clone and manage files and folders based on the specified configurations.

## Definitions
- BASE_PATH: The root folder where the operation begins.
- BASE_TARGET: The target folder where cloning will take place.

## Makefile Commands
Build and Setup
Use the following command to build and configure the project:
make build_target BASE_PATH=$BASE_PATH BASE_TARGET=$BASE_TARGET DIR_NAME=$DIR/$NAME

## Uninstallation
To remove the setup:
make uninstall

## Service Commands
Control the traceclone service using these commands:
- Start: traceclone start
- Status: traceclone status
- Restart: traceclone restart
- Stop: traceclone stop

## Permissions Requirements
Before running the application, ensure that:
1. Source Files: All files in the src folder are owned by the apache user.
2. Clone Folder: The folder designated for cloning is also owned by the apache user.
3. Application User: The application must be executed under the apache user.

Example command to verify permissions:
ls -la /path/to/src
ls -la /path/to/clone

## To set the correct permissions:
chown -R apache:apache /path/to/src
chown -R apache:apache /path/to/clone
