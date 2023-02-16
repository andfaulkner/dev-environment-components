Add cron job to run as root
===========================
1.  Switch to root:
    sudo su

2.  Create file to run e.g.:
    `touch ~/test-cron`

3.  Input script behaviour into the created file (so it can run as a standalone). e.g.:

    ```
    #!/usr/bin/env bash

    echo "test-item - $(date)" >> /root/log-test-cron.txt
    ```
    -   Note the shebang above

4.  Make the file executable e.g.:
    `chmod u+x ~/test-cron`

5.  Create file in `vim /etc/cron.d/`. You can give it any name. e.g.:
    `touch /etc/cron.d/0minutely`

6.  Add cron behaviour to new script e.g.:

    ```
    # Run the minutely jobs
    SHELL=/bin/bash
    PATH=/sbin:/bin:/usr/sbin:/usr/bin
    MAILTO=root

    * * * * * root /root/test-cron
    ```
    -   Bottom line sets up the cron job to run every minute (this is what the `* * * * *` means).

7.  Restart cron (see below)


----------------------------------------------------------------------------------------------------
Restart/start cron on RHEL Linux (e.g. AWS Linux)
=================================================
    sudo service crond stop
    sudo service crond start
    sudo service crond restart

One-liner:

    sudo service crond stop; sudo service crond start; sudo service crond restart

----------------------------------------------------------------------------------------------------
See cron status
===============
    sudo service crond status -l

----------------------------------------------------------------------------------------------------
Edit cron items for current user
================================
1.  Open file for current user with `crontab -e`

2.  Make edits (see "Adding jobs" section below).
    -   Each line is a single job (along with the interval it runs at)

3.  Save with :wq
    -   If the line is invalid, it will fail to save and tell you
    -   To try editing it again, press "Y"

----------------------------------------------------------------------------------------------------
Cron commands - lines added via crontab -e
==========================================
General format
--------------
    * * * * * COMMAND

### Definition
.---------------- minute (0 - 59)
|  .------------- hour (0 - 23)
|  |  .---------- day of month (1 - 31)
|  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
|  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
|  |  |  |  |
*  *  *  *  *     [command to be executed]
                  /\
                  ||
                  Can be multiple words.
                  Best bet: run an external script


Definitions
-----------

# 17 *  *  *  *     root        cd / && run-parts --report /etc/cron.hourly
# 25 6  *  *  *     root        test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
# 47 6  *  *  7     root        test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
# 52 6  1  *  *     root        test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
#

