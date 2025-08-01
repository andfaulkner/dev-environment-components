Modify git commit user, email, and/or date
==========================================
To modify date
--------------
```sh
# Modify to however many back you need to go
git rebase -i HEAD~6
# In the selection area, type ‘edit’ (instead of pick) beside whichever you want to modify the date of.

# Run this, replacing the date with yours:
GIT_AUTHOR_DATE="2024-12-21T04:16:57" GIT_COMMITTER_DATE="2024-12-21T04:16:57" git commit --amend --date="2024-12-21T04:16:57"

# Run this:
git rebase —continue
```

To modify user/email
--------------------
```sh
# Modify “6” to however many back you need to go
git rebase -i HEAD~6

# In the selection area, type ‘edit’ (instead of pick) beside whichever you want to modify the author/email of.

# Run this:
GIT_AUTHOR_EMAIL="andfaulkner@gmail.com" GIT_COMMITTER_EMAIL="andfaulkner@gmail.com" git amend

# Finish with:
git rebase —continue
```
