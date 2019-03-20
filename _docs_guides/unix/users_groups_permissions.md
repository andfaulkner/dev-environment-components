# USERS

---

---

---

## Current user

### Get current user

Command: `whoami`
Example output: `andrew`

### Switch current user (in terminal)

Command: `su - {username}` # Or input no username to switch to root

### Who is user 500?

-   The 1st "real" (non-admin etc) user on AWS Linux. Just a normal user.
-   Not found in /etc/passwd or /etc/group.

---

## Add & modify users/privileges

### Change file owner

Command: `chown new-user ./file/or/dir/to/change/owner/of`
Modifies what user owns a given file or directory.

### Create a new user

Command: `adduser`
Example: `adduser new_user_name_here`

### Add a user to the sudo group

Command: `usermod -aG sudo user_name_here`

---

---

---

# GROUPS

## List groups

### Get a list of all groups

Command: `groups`

Outputs list of all groups that exist. e.g. output:

    andrew adm cdrom sudo dip plugdev lpadmin sambashare

### Get a list of all gids (for each group)

Command: `id`

Example output:

    uid=1000(andrew) gid=1000(andrew) groups=1000(andrew),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lpadmin),110(sambashare)

---

## Group info on specific user

### Get a list of all groups a user is part of (names) - including supplementary groups

    groups {username}
        # OR
    id -GN {username}

    - output list of all groups user is part of. e.g. output:

            andrew : andrew adm cdrom sudo dip plugdev lpadmin sambashare
                # OR (if you use the 2nd option)
            andrew adm cdrom sudo dip plugdev lpadmin sambashare

### Get specific user's group name

Command: `id -gn {username}`
Example output: `andrew`

### Get current user's group id

Command: `id -g`
Example output: `1000`

### Get specific user's group id

Command: `id -g {username}`
Example output: `1000`

### Get list of all group ids/groups a user is part of (including supplementary groups)

Command: `id -G {username}`
Example output: `1000 4 24 27 30 46 108 110`

-   First group outputted is the primary group (generally?)
-   Full list of all groups user is part of

### Get specific user's group name

Command: `id -gn {username}`
Example output: `andrew`

---

## Creating groups

### Create new group 'common'

    sudo groupadd common

## /etc/group file

-   Stores group info, defines user groups (groups users belong to)
-   Can create new groups here
-   Example content (numbers & lines added for labelling purposes):
```
cdrom:x:24:andrew,postgres
|     | |  |
|     | |  |
1     2 3  4
```

1.  group name
2.  password <<< never actually set
3.  group ID (GID)
4.  Group List: list of usernames that are members of the group
