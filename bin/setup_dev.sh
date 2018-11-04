#!/bin/bash
# Setup Development Project
if [ "$#" -ne 3 ]; then
    echo "Usage:"
    echo "  $0 GUID REPO CLUSTER"
    echo "  Example: $0 jhh https://github.com/wkulhanek/ParksMap 192.168.64.21.nip.io"
    exit 1
fi


GUID=$1
REPO=$2
CLUSTER=$3
echo "Setting up Jenkins in project ${GUID}-jenkins from Git Repo ${REPO} for Cluster ${CLUSTER}"


# Code to set up the parks development project.

# To be Implemented by Student
oc project jhh-tasks-dev
oc new-app -f ../templates/jhh-tasks-dev-template.yaml
