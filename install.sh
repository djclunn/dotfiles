#!/bin/bash
for pkg in './packages'
do apt install $pkg
done
for file in './files_to_link'
do
