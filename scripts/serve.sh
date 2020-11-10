#! /bin/sh

# This script runs the speccy ReDoc server to allow browser-based API exploration.
# Since the spec must be merged into a single file to be served, this script does so first, using speccy resolve.

# create temp file (so we can delete it later)
tmpfile=$(mktemp)

# merge all the spec files into out (resolves the $ref links)
yarn speccy resolve ./src/spec/index.yaml -o "$tmpfile" --quiet

# serve the output
yarn speccy serve "$tmpfile"

# since the serve command must be aborted to end it, we leave the temp file cleanup to the OS
