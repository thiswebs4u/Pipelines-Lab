#!/bin/bash
# Setup Sonarqube Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Setting up Sonarqube in project $GUID-sonarqube"

# Code to set up the SonarQube project.
# Ideally just calls a template

oc project jhh-sonarqube
oc new-app -f ../templates/jhh-sonarqube-template.yaml
#--param .....

# To be Implemented by Student
