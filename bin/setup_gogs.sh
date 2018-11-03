#!/bin/bash
# Setup Nexus Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Setting up Gogs in project $GUID-nexus"

# Code to set up the Nexus. It will need to
# * Create Nexus
# * Set the right options for the Nexus Deployment Config
# * Load Nexus with the right repos
# * Configure Nexus as a docker registry
# Hint: Make sure to wait until Nexus if fully up and running
#       before configuring nexus with repositories.
#       You could use the following code:
# while : ; do
#   echo "Checking if Nexus is Ready..."
#   oc get pod -n ${GUID}-nexus|grep '\-2\-'|grep -v deploy|grep "1/1"
#   [[ "$?" == "1" ]] || break
#   echo "...no. Sleeping 10 seconds."
#   sleep 10
# done

# Ideally just calls a template
oc project jhh-gogs

oc new-app -f ../templates/$GUID-postgresql-for-gogs.yaml


while : ; do
   echo "Checking if PostGresQL is Ready..."
   oc get pod |grep -i $GUID-postgresql|grep -v deploy|grep "1/1"
   [[ "$?" == "1" ]] || break
   echo "...no. Sleeping 10 seconds."
   sleep 10
done

echo "PostGres Deployed ***********************************************************************************"

oc new-app -f ../templates/$GUID-gogs-template.yaml

#if [ -e openshift-tasks ]
#git clone https://github.com/wkulhanek/openshift-tasks.git
#cd $HOME/openshift-tasks
#git remote add gogs http://$(oc get route gogs -n jhh-gogs --template='{{ .spec.host }}')/CICDLabs/openshift-tasks.git
#git push -u gogs master
