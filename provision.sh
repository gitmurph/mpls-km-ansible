#!/bin/bash

EXIT=0
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ./deploy_pe.yml <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ./deploy_ce.yml <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ./connection_check.yml <<< 'connectivity check' || EXIT=$?
echo $EXIT
exit $EXIT
