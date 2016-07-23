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

## Usage (`docker-compose`)



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
Nginx | 1.11.1
Sinatra | 1.4.7
