#!/bin/sh -e

# ----------------------------------------------------------------------
# all.do
# ----------------------------------------------------------------------

. ./defs.sh

subdir_targets redo-ifchange all
echo "Nothing much to do.  Try 'redo t/all' or 'redo test'" >&2
