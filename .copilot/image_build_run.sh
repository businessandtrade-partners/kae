#!/usr/bin/env bash

# Exit early if something goes wrong
set -e

# Add commands below to run inside the container after all the other buildpacks have been applied

cp -r /workspace/db/ /workspace/db-copy/
cp -r /workspace/public/ /workspace/public-copy/

rm -rf /workspace/tmp
rm -rf /workspace/db
rm -rf /workspace/log
rm -rf /workspace/public
