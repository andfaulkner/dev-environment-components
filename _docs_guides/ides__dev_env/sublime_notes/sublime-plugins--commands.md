Access a (large) list of all recently closed files, open recently closed file
=============================================================================
-   Install Terminal package::: ctrl-shift-p -> install -> File History
-   ctrl-alt-t will now open a list of recently closed files you can pick from
-   add the following to the User Settings for the package (prevents an annoying bug):

        {
            // Should we show a preview of the history entries?
            "show_file_preview": false,
            //Rm nonexistent files from history (when previewed or opened)
            "remove_non_existent_files_on_preview": true
        }

Move cursor position command
============================
command: move {"by": "words", "forward": false, "extend":true}

Expand selection to something
=============================
command: expand_selection {"to": "brackets"}

Add characters
==============
command: insert {"characters": "\n"}

Delete characters
=================
command: left_delete
command: right_delete
