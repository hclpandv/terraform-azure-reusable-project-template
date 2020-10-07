#!/usr/bin/env bash

#------------------------------------------
# example:
#        ./create-new-module.sh testModule
#------------------------------------------

#Params
module_name="${1:-}"
module_dir="../modules"

mkdir $module_dir/$module_name

echo "# Add Output Here" > "$module_dir/$module_name/output.tf"
echo "# Add Variables Here" > "$module_dir/$module_name/variables.tf"
echo "# Add Main logic Here" > "$module_dir/$module_name/main.tf"
