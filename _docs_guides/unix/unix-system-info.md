Get Linux distro from CLI
-------------------------
```bash
lsb_release -a
```

get kernal info from CLI
------------------------
```bash
uname -a
```

Ensure user is currently running Linux:
```bash
if [ $(uname) == "Linux" ]; then
    echo "OK";
fi
```

Ensure user is currently running Mac:
```bash
if [ "$(uname -s)" = "Darwin" ]; then
    echo "I'm a Mac!"
fi
```