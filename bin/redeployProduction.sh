#!/bin/bash

cd $(dirname $0)/..

RAILS_ENV=production bundle exec rake assets:precompile
touch tmp/restart.txt 

