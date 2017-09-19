Create menu entries
===================
Files
-----
*   To add menu item, create file corresponding to the specific menu type

### Main.sublime-menu 
*   ST3's menu bar

### Side Bar.sublime-menu
*   Menu appearing on right-click of menu over text area

### Context.sublime-menu
*   right-click menu over the text area

Format of menu config
---------------------
### One-level
Example:
    [
        {
            "id" : "cnPremailer",
            "caption" : "cnPremailer",
            "command" : "cnpremailer"
        }
    ]

Props
*   id      :: basic menu id for your entry
*   caption :: display label (defaults to command name if not given)
*   command :: case-sensitive command derived from your class name

### Multi-level
Example:
    [
        {
            "id" : "cnPremailer",
            "caption": "cnPremailer",
            "children":
            [
                {
                    "caption" : "run",
                    "command" : "cnpremailer"
                }
            ]
        }
    ]
