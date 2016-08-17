################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ELIXIR ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

echo "* Elixir scripts loading..."

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

echo "* Elixir scripts loaded!"

