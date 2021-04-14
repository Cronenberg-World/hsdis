#!/bin/bash

current_dir=$(pwd)
#hash=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
work_dir="/tmp/hsdis-install"

if [ -z "$JAVA_HOME" ]; then
  echo "JAVA_HOME is not set"
  exit 1
fi

if [ ! -d "$work_dir" ]; then
  mkdir $work_dir
  cd $work_dir
  curl -L -s https://github.com/oracle/graal/archive/refs/heads/master.zip > master.zip
  unzip master.zip 1>/dev/null
  cd graal-master
  curl -L -s https://github.com/graalvm/mx/archive/refs/heads/master.zip > mx.zip
  unzip mx.zip 1>/dev/null
fi

cd $work_dir/graal-master/compiler
/bin/bash ../mx-master/mx hsdis

cd $current_dir