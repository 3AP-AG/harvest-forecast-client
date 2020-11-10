#! /bin/sh

# This script runs the speccy linter on the OAS3 spec.
# Since the spec must be merged into a single file to be linted, this script does so first, using speccy resolve.

# create temp file (so we can delete it later)
tmpfile=$(mktemp)

# merge all the spec files into out (resolves the $ref links)
yarn speccy resolve ./src/spec/index.yaml -o "$tmpfile" --quiet

# lint the output
# we ignore the 'parameter-description' rule for now since it is noisy
yarn speccy lint "$tmpfile" --skip parameter-description
lint_success=$?

# Delete the temp file
# (even if the script crashes, the temp file will be automatically deleted by the OS at some point in the future)
rm -f "$tmpfile"

# this script's return value is the return value of the lint command; if linting non-0, so is this script
exit $lint_success
