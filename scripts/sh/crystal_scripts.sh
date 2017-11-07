
cry_method_implementation() {
    local PATH_TO_FILE=$1
    local LINE_NO=$2
    local COL_NO=$3
    crystal tool implementations --cursor $PATH_TO_FUNC:$LINE_NO:$COL_NO $PATH_TO_FUNC
}

alias cr_guardian="guardian"
