#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

files = "
.lldbinit
.gitconfig
.profile
"

for file in $files
do
    if [ ! -f ~/$file ]; then
        echo "$file not found!  Creating symbolic link"
        ln -s $DIR/$file ~/$file
    fi
done

