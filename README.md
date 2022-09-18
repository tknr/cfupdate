# cfupdate
folked from https://gist.github.com/lifehome/eb3f7d798f9bc6720cdc7d2be1238d4f

# Cloudflare DDNS bash client with systemd
This is a bash script to act as a Cloudflare DDNS client, useful replacement for ddclient.

# Look out!
## A newer version is available!
This gist will no longer update, instead please go to https://github.com/lifehome/systemd-cfddns for more updated versions.

# How to use?
1) Put the `cfupdater` files to `/usr/local/bin`
  - If you are using IPv4 for A record, append `-v4` to `cfupdater` in the following systemd service unit.
  - If you are using IPv6 for AAAA record, append `-v6` to `cfupdater` in the following systemd service unit.
  - If you prefer a **dual-stack** record, append `-dualstack` to `cfupdater` in the following systemd service unit.
2) `chmod +x /usr/local/bin/cfupdater`
3) Create a systemd service unit at `/etc/systemd/system/`, the `cfupdate.service` is shown as an example.
4) Create a systemd timer unit at **the same location of the service unit**, the `cfupdate.timer` is shown as an example.
5) `sudo systemctl enable cfupdate.timer`
6) `sudo systemctl start  cfupdate.timer`

# Note
The default `cfupdate.timer` is set to execute the script **every minute**.  
Please keep in mind not to spam the API or you will be rate limited.

The dual-stack script has NOT been tested, use with caution.
The dual-stack script will always sync upon either IPv4 or IPv6 has changed.

A quote from Cloudflare FAQ:
> All calls through the Cloudflare Client API are rate-limited to 1200 every 5 minutes.
>
> -- https://support.cloudflare.com/hc/en-us/articles/200171456

