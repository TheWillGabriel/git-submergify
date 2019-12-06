#!/bin/bash
echo "GitHub username?"
read _username

echo "Parent repository name?"
read _parent

echo "Child repository names? (space separated)"
read _children
IFS=" " read -ra _child_array <<< "$_children"

echo
echo "Creating new parent repository in ./$_parent/"
echo

mkdir $_parent
cd $_parent
touch README.md
git init
git add .
git commit -m "Add README.md"

echo
echo "Pushing to remote at git@github.com:${_username}/${_parent}.git"
echo

git remote add origin git@github.com:${_username}/${_parent}.git
git push -u origin master

echo
echo "Adding child repositories . . ."

for _child in "${_child_array[@]}"
do
  echo
  echo "Merging git@github.com:${_username}/${_child}.git into ./${_parent}/${_child}/"
  echo

  git remote add -f ${_child} git@github.com:${_username}/${_child}.git
  git merge -s ours --no-commit ${_child}/master --allow-unrelated-histories
  git read-tree --prefix=${_child}/ -u ${_child}/master
  git commit -m "Merge ${_child} into ${_child}/"
  git remote rm ${_child}
done

echo
echo "Pushing changes to remote at git@github.com:${_username}/${_parent}.git"
echo

git push

echo
echo "Merge complete! Don't forget to update the README.md"
echo "Local directory: ./${_parent}"
