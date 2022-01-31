#!/bin/bash

# Copies current directory to target

unset p_target_dir
unset p_owner
unset p_group
unset p_perm

while :; do
    case $1 in
        -d|--dir) shift; p_target_dir=$1
        ;;
        -o|--owner) shift; p_owner=$1
        ;;
        -g|--group) shift; p_group=$1
        ;;
        -p|--perm) shift; p_perm=$1
        ;;
        *) break
    esac
    shift
done

# Validation

if [ -z $p_target_dir ]; then
  echo "Usage: copy_dir.sh"
  echo "    -d <target>      - The target directory. (REQUIRED)"
  echo "    -o <owner>       - The file's owner. (OPTIONAL)"
  echo "    -g <group>       - The file's group. (OPTIONAL)"
  echo "    -p <permissions> - The file's permissions. (OPTIONAL)"

  return
fi

if [ -z $p_owner ]; then
  unset l_owner
else
  l_owner=--usermap=*:$p_owner
fi

if [ -z $p_group ]; then
  unset l_group
else
  l_group=--groupmap=*:$p_group
fi

if [ -z $p_perm ]; then
  unset l_perm
else
  l_perm=--chmod=$p_perm
fi

echo $l_owner

# Script

echo "Starting directory copy..."

rsync --ignore-existing $l_owner $l_group $l_perm -avh * "$p_target_dir"

echo "Finished copying directory."

unset l_owner
unset l_group
unset l_perm

return
