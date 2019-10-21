#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -f ~/.lldbinit ]; then
    echo ".lldbinit not found!  Creating symbolic link"
    ln -s $DIR/.lldbinit ~/.lldbinit
fi
