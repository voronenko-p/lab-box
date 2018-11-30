# Static parameters
WORKSPACE=./
BOX_PLAYBOOK=$WORKSPACE/box.yml
BOX_NAME=provision_new_vps
BOX_ADDRESS=$EXTERNALBOX
BOX_USER=$VENDORBOXUSER
BOX_PWD=$VENDORBOXPASSWORD

prudentia ssh <<EOF
unregister $BOX_NAME

register
$BOX_PLAYBOOK
$BOX_NAME
$BOX_ADDRESS
$BOX_USER
$BOX_PWD

verbose 4
set box_address $BOX_ADDRESS
set ansible_become_password $VENDORBOXPASSWORD
set external_user $EXTERNALUSER

provision $BOX_NAME
EOF
