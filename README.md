# MUNS (Munitions)

[![](https://img.shields.io/badge/Docker%20Hub-info-blue.svg)](https://hub.docker.com/r/thyrlian/muns/)
[![](https://badge.imagelayers.io/thyrlian/muns:latest.svg)](https://imagelayers.io/?images=thyrlian/muns:latest)
[![Build Status](https://travis-ci.org/thyrlian/MUNS.svg?branch=master)](https://travis-ci.org/thyrlian/MUNS)

A Docker image includes **MongoDB** + **Unicorn** + **Nginx** + **Sinatra**.

<img src="https://github.com/thyrlian/MUNS/blob/master/MUNS.png">

```
 ███╗   ███╗ ██╗     ██╗ ███╗    ██╗ ██████████╗
 ████╗ ████║ ██║     ██║ ████╗   ██║ ██╔═══════╝
 ██╔████╔██║ ██║     ██║ ██╔██╗  ██║ ██████████╗
 ██║╚██╔╝██║ ██║     ██║ ██║ ╚██╗██║ ╚═══════██║
 ██║ ╚═╝ ██║ ╚████████╔╝ ██║   ╚███║ ██████████║
 ╚═╝     ╚═╝  ╚═══════╝  ╚═╝    ╚══╝ ╚═════════╝

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
```

## Structure Depiction

* **Ruby** talks to -> **MongoDB** via `mongo-ruby-driver`
* **Nginx** talks to -> **Unicorn** via `unicorn.sock`

## Usage (docker-compose)

* Set environment variables in corresponding env files (under `env` directory)
* Update startup scripts if necessary (under `volumes/init` directory)
* Run `docker-compose up`
* To debug with interactive mode: `docker exec -it <container_name> bash`

## Usage (all-in-one image)

* Run container in background
    ```bash
    docker run -d -p 80:80 -p 443:443 thyrlian/muns:latest
    ```

* Run container with an interactive shell
    ```bash
    docker run -i -t -p 80:80 -p 443:443 thyrlian/muns:latest /bin/bash
    ```

## Version History (all-in-one image)

**1.0**

Component | Version
--------- | -------
Ruby | 2.3
MongoDB | 3.2.6
Unicorn | 5.1.0
Nginx | 1.11.2
Sinatra | 1.4.7

**1.1**

Component | Version
--------- | -------
Ruby | 2.3
MongoDB | 3.2.10
Unicorn | 5.2.0
Nginx | 1.11.5
Sinatra | 1.4.7

## License

Copyright (c) 2016 Jing Li. See the [LICENSE](https://github.com/thyrlian/MUNS/blob/master/LICENSE) file for details.
