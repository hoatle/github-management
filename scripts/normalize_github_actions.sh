#!/bin/bash

set -e

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

# allow to specify the target branch name, otherwise, use $GITHUB_REF to extract info
if [ -z "${BRANCH_NAME}" ]; then
  # see: https://stackoverflow.com/questions/3162385/how-to-split-a-string-in-shell-and-get-the-last-field
  export BRANCH_NAME=$(echo ${GITHUB_REF} | sed -e "s/refs\/heads\///g" | sed -e "s/refs\/tags\///g" \
    | sed -e "s/refs\/pull\///g" |  sed -e "s/\//-/g")
fi

echo "\$BRANCH_NAME: $BRANCH_NAME"

# affix
AFFIX=$(echo "$BRANCH_NAME" | awk '{print tolower($0)}' | sed -e 's/[\/]/-/g' | sed -e 's/[\#]//g' | sed -e 's/[\.]/_/g');

. ./scripts/re_export_env_var.sh _${AFFIX^^}

echo "::set-env name=BRANCH_NAME::$BRANCH_NAME"
