alias current_directory="pwd | rev | cut -d'/' -f1 | rev"

#=== FUNCTION ==========================================================
#        NAME:  build_sublime_project_file
# DESCRIPTION:  Construct a new {project_name}.sublime-snippet file
#   @PARAM $1:  project name. Defaults to name of current directory.
#=======================================================================
function build_sublime_project_file() {
    local OUTPUT_FILE=$([ ! -z "${1// }" ] && echo "$PWD/$1.sublime-project" || \
                                              echo "$PWD/$(current_directory).sublime-project")
    local HOME_DIR="$(echo ~)"
    echo $OUTPUT_FILE

    ############ START HEREDOC ############
cat << SUBLIME_PROJECT_FILE > "$OUTPUT_FILE"
{
    "folders":
    [
        {
            "path": ".",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/Library/Application Support/Sublime Text 3/Packages/User/snippets/_docs_guides",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/Library/Application Support/Sublime Text 3/Packages/User/snippets/custom-manuals",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/Library/Application Support/Sublime Text 3/Packages/User/snippets/scripts/sh",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/Library/Application Support/Sublime Text 3/Packages/User/snippets/snippets",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/projects/new_node_modules/mad-logs",
            "folder_exclude_patterns": ["node_modules"]
        },
        {
            "path": "$HOME_DIR/projects/new_node_modules/mad-utils",
            "folder_exclude_patterns": ["node_modules"]
        }
    ]
}
SUBLIME_PROJECT_FILE
    ############ END HEREDOC ############
}

alias newnode__sublime_project_base=build_sublime_project_file

