#!/bin/bash

###############################################################################
## Init enviroiment source
dir_path=$(dirname $0)
source $dir_path/config.cfg
source $dir_path/lib/functions.sh
source $dir_path/admin-openrc

### Running function
### Checking and help syntax command
if [ $# -ne 1 ]; then
        echocolor  "Syntax command "
        echo "Syntax command on Controller: bash $0 controller"
        echo "Syntax command on Compute01: bash $0 compute01"
        echo "Syntax command on Compute02: bash $0 compute02"
        echo "Syntax command on Cinder01: bash $0 cinder01"
        exit 1;
fi

if [ "$1" == "controller" ]; then
        bash $dir_path/install/install_keystone.sh
        bash $dir_path/install/install_glance.sh
        bash $dir_path/install/install_nova.sh $1
        bash $dir_path/install/install_neutron.sh $1
        bash $dir_path/install/install_horizon.sh

elif [ "$1" == "compute01" ] || [ "$1" == "compute02" ]; then
    bash $dir_path/install/install_nova.sh $1
    bash $dir_path/install/install_neutron.sh $1

else
    echocolor "Error syntax"
    echocolor "Syntax command"
    echo "Syntax command on Controller: bash $0 controller"
    echo "Syntax command on Compute01: bash $0 compute01"
    echo "Syntax command on Compute02: bash $0 compute02"
    echo "Syntax command on Cinder01: bash $0 cinder01"
    exit 1;

fi