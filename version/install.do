#!/bin/sh -e

# ----------------------------------------------------------------------
# install.do
# Install version
# ----------------------------------------------------------------------

. ./defs.sh

redo-ifchange version.py

evald $INSTALL -d $LIBDIR
evald $INSTALL -m 0644 version.py $LIBDIR/version.py
