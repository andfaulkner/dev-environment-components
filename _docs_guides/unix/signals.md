| Signal name | Signal #   | Action    | Description / notes                            |
|-------------|------------|-----------|------------------------------------------------|
| SIGKILL     | 9          | Terminate | Kill signal                                    |
| SIGTERM     | 15         | Terminate | Termination signal                             |
| SIGQUIT     | 3          | Core      | Quit, coming from keyboard                     |
| SIGSTOP     | 17, 19, 23 | Stop      | Stop process                                   |
| SIGTSTP     | 18, 20, 23 | Stop      | Stop typed at terminal                         |
| SIGPIPE     | 13         | Terminate | Broken pipe: write to pipe w no readers (err)  |
| SIGHUP      | 1          | Terminate | Controlling cli or process died or hung up     |
| SIGINT      | 2          | Terminate | Runs when you hit ctrl-c on controlling cli    |