Examples
========
Default OSX sublime mousemap
----------------------------
[
  {
    "button": "button1",
    "modifiers": ["alt"],
    "press_command": "drag_select",
    "command": "elixir_goto_definition"
  },
  {
    "button": "button1",
    "modifiers": ["shift"],
    "press_command": "drag_select",
    "press_args": {"extend": true}
  }
]

OSX MouseEventListener mousemap w/ annotations
----------------------------------------------
[link to file in repo](Link: https://github.com/SublimeText/MouseEventListener/blob/master/Default%20(OSX).sublime-mousemap)

Code:

    [
        // Basic drag select
        {
            "button": "button1", "count": 1,
            "press_command": "drag_select_callback"
        },
        {
            // Select between selection and click location
            "button": "button1", "modifiers": ["shift"],
            "press_command": "drag_select_callback",
            "press_args": {"extend": true}
        },
        {
            "button": "button1", "count": 1, "modifiers": ["super"],
            "press_command": "drag_select_callback",
            "press_args": {"additive": true}
        },
        {
            "button": "button1", "count": 1, "modifiers": ["shift", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"subtractive": true}
        },

        // Drag select by words
        {
            "button": "button1", "count": 2,
            "press_command": "drag_select_callback",
            "press_args": {"by": "words"}
        },
        {
            "button": "button1", "count": 2, "modifiers": ["super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "words", "additive": true}
        },
        {
            "button": "button1", "count": 2, "modifiers": ["shift", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "words", "subtractive": true}
        },

        // Drag select by lines
        {
            "button": "button1", "count": 3,
            "press_command": "drag_select_callback",
            "press_args": {"by": "lines"}
        },
        {
            "button": "button1", "count": 3, "modifiers": ["super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "lines", "additive": true}
        },
        {
            "button": "button1", "count": 3, "modifiers": ["shift", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "lines", "subtractive": true}
        },

        // Alt + Mouse 1 Column select
        {
            "button": "button1", "modifiers": ["alt"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns"}
        },
        {
            "button": "button1", "modifiers": ["alt", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns", "additive": true}
        },
        {
            "button": "button1", "modifiers": ["alt", "shift", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns", "subtractive": true}
        },

        // Mouse 3 column select
        {
            "button": "button3",
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns"}
        },
        {
            "button": "button3", "modifiers": ["super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns", "additive": true}
        },
        {
            "button": "button3", "modifiers": ["shift", "super"],
            "press_command": "drag_select_callback",
            "press_args": {"by": "columns", "subtractive": true}
        }
    ]


Windows MouseEventListener mousemap w/ annotations
--------------------------------------------------
    // Basic drag select
    {
        "button": "button1", "count": 1,
        "press_command": "drag_select_callback"
    },
    {
        "button": "button1", "count": 1, "modifiers": ["ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"additive": true}
    },
    {
        "button": "button1", "count": 1, "modifiers": ["alt"],
        "press_command": "drag_select_callback",
        "press_args": {"subtractive": true}
    },

    // Select between selection and click location
    {
        "button": "button1", "modifiers": ["shift"],
        "press_command": "drag_select_callback",
        "press_args": {"extend": true}
    },
    {
        "button": "button1", "modifiers": ["shift", "ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"additive": true, "extend": true}
    },
    {
        "button": "button1", "modifiers": ["shift", "alt"],
        "press_command": "drag_select_callback",
        "press_args": {"subtractive": true, "extend": true}
    },

    // Drag select by words
    {
        "button": "button1", "count": 2,
        "press_command": "drag_select_callback",
        "press_args": {"by": "words"}
    },
    {
        "button": "button1", "count": 2, "modifiers": ["ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "words", "additive": true}
    },
    {
        "button": "button1", "count": 2, "modifiers": ["alt"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "words", "subtractive": true}
    },

    // Drag select by lines
    {
        "button": "button1", "count": 3,
        "press_command": "drag_select_callback",
        "press_args": {"by": "lines"}
    },
    {
        "button": "button1", "count": 3, "modifiers": ["ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "lines", "additive": true}
    },
    {
        "button": "button1", "count": 3, "modifiers": ["alt"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "lines", "subtractive": true}
    },

    // Shift + Mouse 2 Column select
    {
        "button": "button2", "modifiers": ["shift"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns"}
    },
    {
        "button": "button2", "modifiers": ["shift", "ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns", "additive": true}
    },
    {
        "button": "button2", "modifiers": ["shift", "alt"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns", "subtractive": true}
    },

    // Mouse 3 column select
    {
        "button": "button3",
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns"}
    },
    {
        "button": "button3", "modifiers": ["ctrl"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns", "additive": true}
    },
    {
        "button": "button3", "modifiers": ["alt"],
        "press_command": "drag_select_callback",
        "press_args": {"by": "columns", "subtractive": true}
    },

    // Simple chording: hold down mouse 2, and click mouse 1
    {
        "button": "button1", "count": 1, "modifiers": ["button2"],
        "command": "expand_selection", "args": {"to": "line"},
        "press_command": "drag_select_callback"
    }
]
