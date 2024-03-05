PATH variable
-------------
-   Available commands are executables in each folder defined in the PATH environment
    variable, visible via: `echo $PATH`

-   Editing $PATH instantly changes what packages are available.

-   To have changes persist, place the new definition in .bash_profile - e.g. add:
    ```
    export PATH="$PATH:/my/new/path/to/add"
    ```

### PATH resolution
-   Items defined earlier in the path take precedence over items defined later

-   Example: If PATH is: `/bin:/sbin`, and both `/bin/test-script` and `/sbin/test-script` exist:
    -   `/bin/test-script` is what gets run when `test-script` is inputted in the terminal, because
        `/bin` was defined first in the path

### Helpers to safely add PATH locations

Add to the beginning of the PATH

    pathprepend() {
        for ((i=$#; i>0; i--)); do
            ARG=${!i}
            if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
                PATH="$ARG${PATH:+":$PATH"}"
            fi
        done
    }

Add to the end of the PATH
pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

    pathadd() {
        if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
            PATH="${PATH:+"$PATH:"}$1"
        fi
    }

-   Doesn't add items already in the path, nor nonexistent locations