#!/bin/bash

EXIT=0
export ANSIBLE_FORCE_COLOR=true
ansible-playbook ./deploy_pe.yml --check <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ./deploy_ce.yml --check <<< 'ansible playbook' || EXIT=$?
sleep 60
ansible-playbook ./connection_check.yml --check <<< 'connectivity check' || EXIT=$?
echo $EXIT
exit $EXIT

