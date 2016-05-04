# get rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# speed up rbenv
cd ~/.rbenv && src/configure && make -C src
#add rbenv to path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init

# ruby-build, make ruby versions easier to get with rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
## for OSX: brew install ruby-build

# rbenv plugin
# gemsets!
git clone git://github.com/jf/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset