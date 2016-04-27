mkdir ~/scripts
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/scripts/git-completion.bash
echo "source ~/scripts/git-completion.bash" >> ~/.bash_profile
. ~/.bash_profile
