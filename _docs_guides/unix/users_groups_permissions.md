---
---
---

# USERS

---

## USERS - Get user info

### USERS - Get current user

-   Command: `whoami`
-   Example output: `andrew`

### USERS - Who is user 500?

-   The 1st "real" (non-admin etc) user on AWS Linux. Just a normal user.
    -   Note: sometimes it's actually 1000! (AWS)
-   Not found in `/etc/passwd` or `/etc/group`.

### USERS - Get ID of given username (UID)

-   Command: `id {username}`
-   Example output: `500`

### USERS - List all users & info on them

-   Command: `getent passwd`
-   Example output:

```
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
```

(See `/etc/group` file section below for more info)

---

## USERS - Edit user permissions

### USERS - Change user's ID (UID)

-   Command: `usermod -u {new_id} {username}`
-   Example: `usermod -u 10000 tom`
    -   Changes UID of user `tom` to `10000`

### USERS - Switch currently active user (in terminal)

-   Command: `su - {username}` # Or input no username to switch to root

### USERS - Change file owner

-   Command: `chown new-user ./file/or/dir/to/change/owner/of`
-   Modifies what user owns a given file or directory.

### USERS - Create a new user

-   Command: `adduser`
-   Example: `adduser new_user_name_here`

### USERS - Add a user to the sudo group

-   Command: `usermod -aG sudo user_name_here`

### USERS - Rename a user

---

---

---

# GROUPS

---

## GROUPS - List info on all groups

### GROUPS - Get a list of all groups

-   Command: `groups`
-   Outputs list of all groups that exist.

-   Example output: `andrew adm cdrom sudo dip plugdev lpadmin sambashare`

### Get a list of all gids (for all groups)

-   Command: `id`
-   Example output:
    `uid=1000(andrew) gid=1000(andrew) groups=1000(andrew),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lpadmin),110(sambashare)`

---

## GROUPS - Get single user's group info

### GROUPS - List all groups a user is in

-   Command: `groups {username}` OR `id -GN {username}`
    -   Outputs list of all groups user is part of, including supplementary groups
-   Example output:
    -   andrew : andrew adm cdrom sudo dip plugdev lpadmin sambashare
        -   # OR (if you use the 2nd option)
    -   andrew adm cdrom sudo dip plugdev lpadmin sambashare

### GROUPS - List all groups a specific user is in

-   Command: `id -gn {username}`
-   Example output: `andrew`

### GROUPS - Get current user's group id

-   Command: `id -g`
-   Example output: `1000`

### GROUPS - Get specific user's group id

-   Command: `id -g {username}`
-   Example output: `1000`

### GROUPS - Get list of all group ids/groups a user is part of (including supplementary groups)

-   Command: `id -G {username}`
-   Example output: `1000 4 24 27 30 46 108 110`

-   First group outputted is the primary group (generally?)
-   Full list of all groups user is part of

### GROUPS - Get specific user's group name

-   Command: `id -gn {username}`
-   Example output: `andrew`

---

## GROUPS - Creating groups

### GROUPS - Create new group

-   Example - Create new `common` group: `sudo groupadd common`

---

## GROUPS - `/etc/group` file

-   See CONFIG FILES section below

---

---

---

# CONFIG FILES

---

## `/etc/passwd` - access with `vipw`

-   Contains all custom-defined users
-   Edit with `vipw`
    -   provides some safeguards to ensure you don't mess it up too badly

-   Example content (numbers & lines added for labelling purposes):

```
ec2-user:x:1000:1000:EC2 Default User:/home/ec2-user:/bin/bash
|        |  |    |   \______________/ \____________/ \_______/
|        |  |    |          |               |            |
1        2  3    4          5               6            7
```

1.  Username
2.  Password <<< never actually set
3.  User ID (UID)
4.  Group ID (GID)
5.  User ID info (basically the comment field)
6.  Home directory: absolute path to dir the user will be in when they log in. Defaults to `/`.
7.  Command/shell: Absolute path of a command or shell (/bin/bash)

---

## `/etc/group` file

-   Stores group info, defines user groups (groups users belong to)
-   Can create new groups here
-   Edit with `vigr`
    -   provides some safeguards to ensure you don't mess it up too badly
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
