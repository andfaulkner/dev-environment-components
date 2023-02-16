PATH environment variable
=========================
-   Available commands in the terminal are executables in each folder defined in the
    `PATH` environment variable, visible via: `echo $PATH`

-   Editing $PATH instantly changes what packages are available.

-   To have changes persist, place the new definition in .bash_profile - e.g. add:
    ```
    export PATH="$PATH:/my/new/path/to/add"
    ```

PATH resolution
---------------
-   Items defined earlier in the path take precedence over items defined later

-   Example: If PATH is: `/bin:/sbin`, and both `/bin/test-script` and `/sbin/test-script` exist:
    -   `/bin/test-script` is what gets run when `test-script` is inputted in the terminal, because
        `/bin` was defined first in the path

Helpers to safely add PATH locations
------------------------------------
Helper to add to the beginning of the PATH:

    ```
pathprepend() {
    for ((i=$#; i>0; i--)); do
        local ARG=${!i}

        # Ensure ARG is a directory before trying to expand
        if [ -d "$ARG" ]; then
            local ABS_PATH=$(readlink -f "$ARG")
            if [[ ":$PATH:" != *":$ABS_PATH:"* ]]; then
                PATH="$ABS_PATH${PATH:+":$PATH"}"
            fi

        # Handle error where invalid directory given
        else
            printf "Error: %s is not a directory.\n" "$ABS_PATH" >&2
        fi
    done
}
    ```

-   Helper to add to the end of the PATH:
    ```
    pathappend() {
        for ARG in "$@"; do

            # Ensure ARG is a directory before trying to expand to absolute path
            if [ -d "$ARG" ]; then
                if [[ ":$PATH:" != *":$ARG:"* ]]; then
                    if ABS_PATH=$(readlink -f "$ARG"); then
                        if [[ ":$PATH:" != *":$ABS_PATH:"* ]]; then
                            PATH="${PATH:+"$PATH:"}$ABS_PATH"
                        fi
                    else
                        PATH="${PATH:+"$PATH:"}$ARG"
                    fi
                fi

            # Handle error where invalid directory given
            else
                printf "Error: %s is not a directory.\n" "$ARG" >&2
            fi
        done
    }

    ```
Neither add items already in the path, nor nonexistent locations.