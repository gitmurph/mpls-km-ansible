This lab demonstrates the deployment of an entire end to end MPLS network using Ansible and some simple Shell scripts. The lab starts off by running a provisioning script which then starts the playbooks to setup the PE routers then the CE routers followed by an end to end connection check inside the MPLS backbone and from the CE routers across the VPN Core.
The provision script is oulined below:

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


This lab was inpsired by Bernd Malmqvist over at techbloc.net, who has some fantastic Ansible and other automation guides outlining various deployment and configuration scenarios and resources. Many thanks to Bernd, we need more sharing in the network automation space!!!
