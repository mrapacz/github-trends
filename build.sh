#!/bin/sh
cd $TRAVIS_BUILD_DIR/project
mix local.rebar --force
mix local.hex --force
mix deps.get

mix test
