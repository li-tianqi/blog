#!/bin/bash

if [ "$1" == "-update" ]
then
    bundle update
fi
sudo rm -rf ./_site
#bundle update
bundle exec jekyll server --incremental
