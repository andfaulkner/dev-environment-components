# git-subrepo

[git-subrepo codebase](https://github.com/ingydotnet/git-subrepo)

[Basic instructions](https://github.com/ingydotnet/git-subrepo/wiki/Basics)

[Workflows](https://github.com/ingydotnet/git-subrepo/wiki/Workflows)

---

---

---

## Committing local changes to branch

After committing changes normally in the parent directory:

    git subrepo push [subrepo-name]

e.g.:

    git subrepo push nanofactory

---

## Change subrepo's tracking branch

To switch tracking branch on one of your subrepos e.g. to go to another tag:

    git subrepo clone --force -b <new_remote_branch> <remote>

Note that changes that you haven't pushed to the subrepo will only be left in the main repo if you do this.

---

## Pull remote changes to tracked branch (update your branch)

    git subrepo pull [subrepo-name]

e.g.:

    git subrepo pull nanofactory

---

---

---

## Links

https://github.community/t5/How-to-use-Git-and-GitHub/Git-and-Git-Subrepo/td-p/5974
https://metacpan.org/pod/distribution/App-Spec/examples/pod/subrepo.pod
