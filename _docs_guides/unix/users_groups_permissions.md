
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
# PERMISSIONS, USERS, GROUPS
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
File permissions
================

Dir that lets you add dirs
--------------------------
    drwxrwxr-x

Dir that doesn't let you add dirs
---------------------------------
    drwxr-xr-x

Permissions by position in file string
--------------------------------------
### Examples

```
drwxrwxrwx
-   Full permissions directory (anyone can do anything)

drwxrwxr-x
-   Dir where anyone can read or create files, but only user & members of group can write to it

-rw-rw-r--
-   File where user & group can read & write, everyone else can only read, and no one can execute

-rw-------
-   File where only user can read & write:

```

### Basic file string (by type)

    duuugggaaa

### Breakdown by section
```
   d           uuu       ggg       aaa
   |          |___|     |___|     |___|
  dir           |         |         |
(- if not)     user     group    other/all
```

### Breakdown of subsection
For all 3:
```
    r               w               x
    |               |               |
   read           write           execute
(- if not)      (- if not)       (- if not)
```



----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
USERS
=====
Get user info
-------------
### Get current user

-   Command: `whoami`
-   Example output: `andrew`

### Who is user 500?

-   The 1st "real" (non-admin etc) user on AWS Linux. Just a normal user.
    -   Note: sometimes it's actually 1000! (AWS)
-   Not found in `/etc/passwd` or `/etc/group`.

### Get ID of given username (UID)

-   Command: `id {username}`
-   Example output: `500`

### List all users & info on them

-   Command: `getent passwd`
-   Example output:

```
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
```

(See `/etc/group` file section below for more info)

----------------------------------------------------------------------------------------------------
Edit user permissions
---------------------
### Change user's ID (UID)
-   Command: `usermod -u {new_id} {username}`
-   Example: `usermod -u 10000 tom`
    -   Changes UID of user `tom` to `10000`

### Switch currently active user (in terminal)
-   Command: `su - {username}` # Or input no username to switch to root

### Change file owner
-   Command: `chown new-user ./file/or/dir/to/change/owner/of`
-   Modifies what user owns a given file or directory.

### Create a new user
-   Command: `adduser`
-   Example: `adduser new_user_name_here`

### Add a user to the sudo group
-   Command: `usermod -aG sudo user_name_here`

### Rename a user
-   WIP



----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
GROUPS
======
List info on all groups
-----------------------
### Get a list of all groups
-   Command: `groups`
-   Outputs list of all groups that exist.

-   Example output: `andrew adm cdrom sudo dip plugdev lpadmin sambashare`

### Get a list of all gids (for all groups)
-   Command: `id`
-   Example output:
    `uid=1000(andrew) gid=1000(andrew) groups=1000(andrew),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lpadmin),110(sambashare)`

----------------------------------------------------------------------------------------------------
Get single user's group info
----------------------------
### List all groups a user is in
-   Command: `groups {username}` OR `id -GN {username}`
    -   Outputs list of all groups user is part of, including supplementary groups
-   Example output:
    -   andrew : andrew adm cdrom sudo dip plugdev lpadmin sambashare
        -   # OR (if you use the 2nd option)
    -   andrew adm cdrom sudo dip plugdev lpadmin sambashare

### List all groups a specific user is in
-   Command: `id -gn {username}`
-   Example output: `andrew`

### Get current user's group id
-   Command: `id -g`
-   Example output: `1000`

### Get specific user's group id
-   Command: `id -g {username}`
-   Example output: `1000`

### Get list of all group ids/groups a user is part of (including supplementary groups)
-   Command: `id -G {username}`
-   Example output: `1000 4 24 27 30 46 108 110`

-   First group outputted is the primary group (generally?)
-   Full list of all groups user is part of

### Get specific user's group name
-   Command: `id -gn {username}`
-   Example output: `andrew`

----------------------------------------------------------------------------------------------------
Creating groups
---------------
### Create new group
-   Example - Create new `common` group: `sudo groupadd common`

----------------------------------------------------------------------------------------------------
`/etc/group` file
-----------------
-   See CONFIG FILES section below



----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
CONFIG FILES
------------
/etc/passwd
-----------
-   access with `vipw`
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

----------------------------------------------------------------------------------------------------
/etc/group
----------
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
