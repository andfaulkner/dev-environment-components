# Start and stop apps

Start an app:

    pm2 start   <appfile.js>

Stop an app:

    pm2 stop    <app_name_app_from_ls_list>
    pm2 stop    <app_name|id|'all'|json_conf>

Restart on code change:

    pm2 reload all

---

# App info

List apps running:

    pm2 ls

Get details on a specific app:

    pm2 describe
