#! /bin/sh

# This script runs the speccy resolver and outputs a single merged OAS3 spec file.
# If a path is provided as the first argument, the resolved spec is saved there. Otherwise, a temp file is created.
# This script can be ignored when using the lint and serve scripts, as this process is handled by them internally.

if [ -z "$1" ] ; then
    echo "No path argument supplied; resolving spec to a temporary file."
    file=$(mktemp) # create temp file
else
  # path specified. now we check it exists
  path=$(echo "$1" | sed -E "s/(.+)\/.+/\1/")
  mkdir -p $path
  file=$1
fi

# merge all the spec files into out (resolves the $ref links)
yarn speccy resolve ./src/spec/index.yaml -o "$file" --quiet

# serve the output
echo "OAS3 Spec resolved to:  $file"

# we leave the temp file cleanup to the OS
