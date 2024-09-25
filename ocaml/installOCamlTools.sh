#!/bin/bash

DEPS="dune merlin ocp-browser ocamlformat user-setup"
CURR_SWITCH=`opam switch show`

echo "Installing the following tools to current opam switch ($CURR_SWITCH): $DEPS"
echo "$DEPS" | xargs -o opam install

echo "Running 'opam user-setup install'"
opam user-setup install
