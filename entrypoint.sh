#! /bin/sh
pwd

ls -al

cd ../..
pwd
ls -al
# copy over ./github/workspace/* /*
rsync --recursive --progress -avzh ./github/workspace/* ./

cd src

# executing the setup.sh script
python ymls_to_ldes_ttl.py

# copy over everything in ./ back to ./github/workspace
# overwrite everything in ./github/workspace
# do not copy over the .git folder and the .github folder 
# also do not copy over the following files:
# .dockerenv
# README.md
# bin folder
# boot folder
# config.yml
# dev folder
# entrypoint.sh
# etc folder
# github folder
# home folder
# lib folder
# lib64 folder
# media folder
# mnt folder
# opt folder
# proc folder
# node_modules folder
# package-lock.json
# package.json
# poetry.lock
# pyproject.toml
# run folder
# root folder
# sbin folder
# src folder
# srv folder
# sys folder
# tmp folder
# usr folder
# var folder

cd ..

rsync --recursive --progress -avzh --exclude=.git --exclude=.github --exclude=.dockerenv --exclude=README.md --exclude=bin --exclude=boot --exclude=config.yml --exclude=dev --exclude=entrypoint.sh --exclude=etc --exclude=github --exclude=home --exclude=lib --exclude=lib64 --exclude=media --exclude=mnt --exclude=opt --exclude=proc --exclude=node_modules --exclude=package-lock.json --exclude=package.json --exclude=poetry.lock --exclude=pyproject.toml --exclude=run --exclude=root --exclude=sbin --exclude=src --exclude=srv --exclude=sys --exclude=tmp --exclude=usr --exclude=var ./ ./github/workspace

rsync --recursive --progress -avzh ./.github/last_ldes_hash ./github/workspace/.github/last_ldes_hash