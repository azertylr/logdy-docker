# logdy-docker

docker for https://github.com/logdyhq/logdy-core


Usage:
````yaml
  logdy:
    image: ghcr.io/azertylr/logdy-docker:latest
    container_name: logdy
    read_only: true
    volumes:
      - /home/docker/caddy/logs:/var/log:ro # folder with logs
      - /home/docker/logdy/logdy_caddy.json:/config/logdy.json # logdy config file
    restart: unless-stopped
    security_opt:
      - no-new-privileges=true
    command: ["--ui-ip", "0.0.0.0", "--config", "/config/logdy.json", "follow", "/var/log/access.log", "/var/log/access_vps.log"]  # only for several logs. Default to "/var/log/access.log"
