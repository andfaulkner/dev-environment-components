################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ELIXIR ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

echo "* Elixir scripts loading..."

alias nukeelixir="ps aux | ack elixir | awk '{print $2}' | xargs kill -9"

# reload elixir app on reload
function relixir {
  if [[ -n "$2" ]]; then
    elixir $2
    fswatch -0 $1 | xargs -0 -n 1 -I {} elixir $2
  elif [[ -n "$1" ]]; then
    elixir $1
    fswatch -0 $1 | xargs -0 -n 1 -I {} elixir $1
  else
    echo "USAGE: relixir path_to_watch [file_to_run]"
    echo "  if file_to_run unprovided:, runs file that was watched"
    echo "    --  (note: if path_to_watch is a dir, file_to_run must be provided)"
  fi
  # else; then
    # fswatch -0 $1 | xargs -0 -n 1 -I {} elixir $1
}  

########## PHOENIX ##########
# Create a new Phoenix app
function newphoenix {
    mix phoenix.new "$1"
    cd "$1"
    mix deps.get
    npm install
    mix ecto.create
    newnode__sublime_project_base
    echo "node_modules" > .gitignore
    touch README.md
    git init
    mkdir doc
    iex -S mix phoenix.server
}

# launch Phoenix server
alias mps="mix phoenix.server"

# view all routes in Phoenix project
alias mproutes="mix phoenix.routes"

echo "* Elixir scripts loaded!"

