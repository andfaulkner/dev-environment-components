Start applications
==================
Start an application from a CLI command
---------------------------------------
    pm2 start ./build/app/server/run-server.js
    pm2 start "npm run start"
    pm2 start "ls -la"

-   You can start things like bash commands, script files, etc.

Start applications with a config file
-------------------------------------
Uses this basic format:

    module.exports = {
        apps: [
            {
                name   : "limit worker",
                script : "./worker.js",
                args   : "limit"
            },
            {
                name   : "rotate worker",
                script : "./worker.js",
                args   : "rotate"
            }
        ]
    }

Start all applications defined in the file via:

    pm2 start path/to/config/eg/application.config.js


Restart applications
-------------------
### Restart application with new environment
    NODE_ENV=production pm2 restart <app-name> --update-env

### Restart one application
    pm2 restart <app_name>

### Restart all applications
    pm2 restart all

### Restart multiple applications
    pm2 restart <app_1_name> <app_2_name> ... <app_n_name>


## Restart on code change (?)
    pm2 reload all

----------------------------------------------------------------------------------------------------
Stop applications
=================
### Stop a single application

    pm2 stop <app_name>

### Stop multiple applications

    pm2 stop <app_1_name> <app_2_name> <app_3_name> ... <app_n_name>

### Stop all applications

    pm2 stop all


----------------------------------------------------------------------------------------------------
App info
========
## List apps running

    pm2 ls

## Get details on a specific app

    pm2 describe

Use pm2 monitoring dashboard
----------------------------

    pm2 monit

-   Includes:
    -   Info on things like memory usage
    -   Application/process metadata
    -   Log outputs

Application metadata
--------------------
    pm2 show api

----------------------------------------------------------------------------------------------------