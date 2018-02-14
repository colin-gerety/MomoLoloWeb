#!/usr/local/bin/bash

export RAILS_ENV=test
# do something to make sure we are in the project directory

# rake environment RAILS_ENV=test db:migrate

# rake db:test:prepare - where should the go (if anywhere)
# http://stackoverflow.com/questions/12156936/rails-rake-dbtestprepare-vs-rake-testprepare

# rake db:test:purge # get rid of all test data

rake test:prepare  # actually calls test:load that prepares the test database. 

# rake db:test:load

> test.out

. $(dirname $0)/test_list.sh

for test_type in $test_types
do
  for test in ${tests[$test_type]}
  do
    echo --------------- $test_type/$test  ------  | tee -a test.out
    ruby -Itest test/$test_type/${test}_test.rb 2>&1 | tee -a test.out | grep assertions
  done
done

