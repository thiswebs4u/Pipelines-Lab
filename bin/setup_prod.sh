#!/bin/bash
# Setup Production Project (initial active services: Green)
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


# Code to set up the parks production project. It will need a StatefulSet MongoDB,
# and two applications each (Blue/Green) for NationalParks, MLBParks and Parksmap.
# The Green services/routes need to be active initially to guarantee a successful
# grading pipeline run.

# To be Implemented by Student
oc project jhh-tasks-prod
oc new-app -f ../templates/jhh-tasks-prod-template.yaml