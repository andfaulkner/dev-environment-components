# to preserve colour in stdout and stderr, get 'expect'/unbuffer utility
brew tap homebrew/dupes/expect
brew install homebrew/dupes/expect
# use via unbuffer command e.g.
export LOG_LEVEL=trace; unbuffer npm run nodemon 2>&1 | tee /dev/ttys007
# --> broadcases node output to a second terminal window, preserving colour in both