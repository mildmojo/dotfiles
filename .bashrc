PATH=$PATH:$HOME/.rvm/bin:$HOME/bin

source $HOME/.promptrc

export EDITOR=nano

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Environment vars, broken out to a separate file
if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi

function rake_one
{
  if (( $# < 1 ))
  then
    printf "Usage: rake_one <resource_name> [test_name]\n"
    return 1
  fi

  specific_test=''
  [[ "$2" != "" ]] && specific_test="--name /$2/"

  TESTS=`find test -name "$1*.rb" | tr "\n" ' '`
  echo ruby -Ilib:test $TESTS $specific_test
  ruby -Ilib:test $TESTS $specific_test
}

function wtf {
  if (( $# < 1 )); then
    printf "Usage: wtf <server_name>"
    return 1
  fi

  server=$1

  if [[ ! "$server" =~ "." ]]; then
    # EDIT THIS to append default domain for server queries
    server=$server.localhost
  fi

  printf "WTF, $server?\n\n"

  # Tail important logs
  # Display useful URLs/hostnames
}
