#! /usr/bin/env bash

FAILED=()

echoStderr()
{
  echo "$@" 1>&2
}

check() {
  LABEL=$1
  shift
  echo -e "\n🧪 Testing $LABEL"
  if "$@" ; then
    echo "✅ Passed!"
    return 0
  else
    echoStdErr "❌ $LABEL check failed."
    FAILED+=("$LABEL")
    return 1
  fi
}

reportResults() {
  if [ ${#FAILED[@]} -ne 0 ]; then
    echoStderr -e "\n💥 Failed tests: ${FAILED[@]}"
    exit 1
  else
    echo -e "\n💯 All passed!"
  fi
}