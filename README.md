Docker NfSen
============

NfSen is a frontend to NFDUMP. It is used to collect and process NetFlow data from network devices.

How to run
----------

Ports:

- `80/tcp` - the nfsen WebUI
- Other ports configured in the `nfsen.conf` file - for getting data from configured devices

Volumes:

| Directory           | nfsen.conf var        |
|---------------------|-----------------------|
| `/config`           | `$CONFDIR`            |
| `/data`             | `$VARDIR`             | 
| `/plugins/backend`  | `$BACKEND_PLUGINDIR`  |
| `/plugins/frontend` | `$FRONTEND_PLUGINDIR` |

Example compose file:

```yaml
---
version: "2.1"
services:
  nfsen:
    image: aastefanov/nfsen
    container_name: nfsen
    volumes:
      - /path/to/data:/data
      - /path/to/config:/config
      - /path/to/plugins:/plugins
    ports:
      - "80:80"
      - "2055:2055" # and other ports configured for netflow/sflow/ipfix
    restart: unless-stopped
```

