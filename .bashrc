PATH=$PATH:$HOME/.rvm/bin:$HOME/bin

source $HOME/.promptrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=nano

alias xclip="xclip -selection c"
alias open="gnome-open"
alias less="zless"
alias subl="subl -a"
alias se="subl -a"
alias sen="subl -n"
alias b="bundle exec"
alias dbr="rake db:drop db:create db:migrate db:test:prepare db:fixtures:load |grep '^==.*migrated'"
alias rpry="rails-console-pry -r awesome_print"
alias grom="git pull --rebase origin master"
alias grc="git rebase --continue"
alias git_url="git config --get remote.origin.url"
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
