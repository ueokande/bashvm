source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_uninstall_installed_version() {
  mkdir $BASHVM_HOME/usr/bash-X.Y
  subject bashvm uninstall X.Y
  assert_false test -d "$BASHVM_HOME/usr/bash-X.Y"
}

testcase_uninstall_gone_version() {
  subject bashvm uninstall su.shi
  assert_match "gone" "$stdout"
  assert_equal 1 $status
}
