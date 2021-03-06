
before_each() {
  tmpdir=$(mktemp -d)
  export BASHVM_HOME=$tmpdir
  export bashvm_default_version="X.1"

  mkdir -p $BASHVM_HOME/usr/bash-{X.0,X.1,Y.0}
  mkdir -p $BASHVM_HOME/src/bash-X.0
  local current_bash_path=$(which bash)
  for dir in $BASHVM_HOME/usr/bash-*; do
    mkdir ${dir}/bin
    ln -s $current_bash_path ${dir}/bin/bash
  done

  source $(dirname $BASH_SOURCE)/../bin/bashvm-init
}

after_each() {
  rm -rf $tmpdir
}
