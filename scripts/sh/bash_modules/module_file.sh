function File {
  echo "File module has the following commands: "
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  egrep "function File\." "$DIR/module_file.sh" | awk '{print "  "$2}'  
  # complexity below is due to need to self-exclude
  awk '/@method/,/function[^t]*/' "$DIR/module_file.sh" | awk '!/  awk '\''\/@method\/,\/function/' #\.\*\/'\'' "
}

# @method get_ext - get the file extension
# @param $1 - path/to/file.ext
# @returns file extension, excluding the dot. E.g. js
function File.get_ext {
  echo "${1##*/}" | awk -F. '{print $NF}'
}

# @method get_first_line - get first line of file
# @param $1 - path/to/file.ext
# @returns first line of file
function File.get_first_line {
  cat $1 | awk 'NR==1'
}

# @method get_line_by_number - get line in file at given line number
# @param $1 - path/to/file.ext
# @param $2 - line to display
# @returns matching line of file
function File.get_line {
  cat $1 | awk "NR==$2"
}