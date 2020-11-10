#! /bin/sh

# This script runs the speccy resolver and outputs a single merged OAS3 spec file.
# This script can be ignored when using the lint and serve scripts, as this process is handled by them internally.

# create temp file (so we can delete it later)
tmpfile=$(mktemp)

# merge all the spec files into out (resolves the $ref links)
yarn speccy resolve ./src/spec/index.yaml -o "$tmpfile" --quiet

# serve the output
echo "OAS3 Spec resolved to:  $tmpfile"

# we leave the temp file cleanup to the OS
