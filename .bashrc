PATH=$PATH:$HOME/.rvm/bin:$HOME/bin

source $HOME/.promptrc

export EDITOR=nano

alias xclip="xclip -selection c"
alias open="gnome-open"
alias less="zless"
#alias subl="subl -a"
#alias se="subl -a"
#alias sen="subl -n"
alias b="bundle exec"
alias dbr="rake db:drop db:create db:migrate db:test:prepare db:fixtures:load |grep '^==.*migrated'"
# Just use Pry everywhere: http://lucapette.me/pry-everywhere
#alias rpry="rails-console-pry -r awesome_print"
alias grom="git pull --rebase origin master"
alias grod="git pull --rebase origin develop"
alias grc="git rebase --continue"
alias git_url="git config --get remote.origin.url"
alias gam="git commit --amend --reuse-message=HEAD"

#alias md5sum="md5 -r"
alias youtube-dl="youtube-dl -x --audio-format mp3"
#alias ls="ls -G"
#alias grep="zgrep --color=auto"

# Gulp CLI completions
#eval "$(gulp --completion=bash)"

# Faster rake startup tip from https://gist.github.com/1688857
# tl;dr = rvm get head && rvm reinstall 1.9.3 --patch falcon -j 3
# tl;dr = add environment vars below when running rake
# alias rake="RUBY_HEAP_MIN_SLOTS=1000000 RUBY_HEAP_SLOTS_INCREMENT=1000000 RUBY_HEAP_SLOTS_GROWTH_FACTOR=1 RUBY_GC_MALLOC_LIMIT=1000000000 RUBY_HEAP_FREE_MIN=500000 rake"

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
