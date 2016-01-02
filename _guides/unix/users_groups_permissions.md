USERS
=====

Get current user
----------------
		whoami

		- e.g. output:

				andrew

Switch current user (in terminal)
---------------------------------
		su - {username}		# or input no username to switch to root


--------------------------------------------------------------------------------------------------
GROUPS
======

List groups
-----------
### Get a list of all groups
		groups 										# (a shell cmd)

		-   outputs list of all groups that exist. e.g. output:

				andrew adm cdrom sudo dip plugdev lpadmin sambashare

### Get a list of all gids (for each group)
		id

		-   e.g. output:

				uid=1000(andrew) gid=1000(andrew) groups=1000(andrew),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(lpadmin),110(sambashare)

Group info on specific user
---------------------------
### Get a list of all groups a user is part of (names) - including supplementary groups
		groups {username}
			# OR
		id -GN {username}

		- output list of all groups user is part of. e.g. output:

				andrew : andrew adm cdrom sudo dip plugdev lpadmin sambashare
					# OR (if you use the 2nd option)
				andrew adm cdrom sudo dip plugdev lpadmin sambashare

### Get specific user's group name
		id -gn {username}

		-   e.g. output:

				andrew

### Get current user's group id
		id -g

		-   e.g. output:

				1000

### Get specific user's group id
		id -g {username}

		-   e.g. output:

				1000

### Get a list of all group ids of groups a user is part of, including supplementary groups
		id -G {username}

		-   output list of all groups user is part of. e.g. output:

				1000 4 24 27 30 46 108 110

		-   first group outputted is the primary group (generally?)

### Get specific user's group name
		id -gn {username}

		-   e.g. output:

				andrew





/etc/group file
---------------
-   stores group info, defines user groups (groups users belong to)


cdrom:x:24:andrew,postgres
_____ _ __ _______________
  |   |  |        |
  |   |  |        |
  1   2  3        4

1.  group name
2.  password <<< never actually set
3.  group ID (GID)
4.  Group List: list of usernames that are members of the group