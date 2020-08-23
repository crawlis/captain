#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd ${DIR}

. ./.config

cmd="docker-compose up --build"

for module in ${MODULES[@]}; do
    module_type=$(echo "${module}_TYPE")
    module_num=$(echo "${module}_NUM")
    cmd="$cmd --scale ${module}-local=$([[ ${!module_type} = 0 ]] && echo ${!module_num} || echo "0")"
    cmd="$cmd --scale ${module}-released=$([[ ${!module_type} = 1 ]] && echo ${!module_num} || echo "0")"
done
export OPT_LEVEL=$OPT_LEVEL && $(echo ${cmd,,})
