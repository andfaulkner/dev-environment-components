Open terminal at current file
=============================
-   Install Terminal package::: ctrl-shift-p -> install -> terminal -> enter
-   Open this from menu: Preferences --> Package Settings --> Terminal --> 'Key Bindings - Default'
-   Replace the contents with this:
				[
					{ "keys": ["ctrl+shift+alt+t"], "command": "open_terminal" }
				]


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

