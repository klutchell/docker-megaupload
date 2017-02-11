# Megaupload Docker Image #

## Description ##

Docker image to upload multiple local files to a mega.nz cloud drive.

Uses [ubuntu](https://hub.docker.com/_/ubuntu/) base image with [megatools](https://github.com/megous/megatools) for uploads.

See the [megatools man page](https://megatools.megous.com/man/megatools.html) for more info.

## Usage ##

```bash
$ docker run \
--name=megaupload \
-e "USERNAME=testuser" \
-e "PASSWORD=topsecret" \
-e "REMOTE_PATH=/Root" \
-v </path/to/config>:/config \
-v <path/to/uploads>:/uploads \
klutchell/megaupload
```

## Parameters ##

* ```-e USERNAME=``` - Mega.nz username.
* ```-e PASSWORD=``` - Mega.nz password.
* ```-e REMOTE_PATH=``` - Remote base directory. The default is the root of your cloud drive (/Root).
* ```-e CACHE_TIMEOUT=``` - Cache timeout in seconds (default is 10 minutes).
* ```-e SPEED_LIMIT=``` - Set maximum allowed upload and download speed in KiB/s. 0 means no limit.
* ```-e DOWNLOAD_SPEED_LIMIT=``` - Set maximum allowed download speed in KiB/s. 0 means no limit. Overrides SpeedLimit setting.
* ```-e UPLOAD_SPEED_LIMIT=``` - Set maximum allowed upload speed in KiB/s. 0 means no limit. Overrides SpeedLimit setting.
* ```-e PROXY_SERVER=``` - Use proxy server to connect to mega.nz. More information can be found in libcurl documentation at https://curl.haxx.se/libcurl/c/CURLOPT_PROXY.html.
* ```-v <path/to/config>:/config``` - Host directory for storing persistent configuration (optional).
* ```-v <path/to/uploads>:/uploads``` - Host directory with files requiring upload. Everything in this dir will be uploaded on every run so keep it clean.

## Configuration ##

To maintain confguration parameters between runs just provide the ```-v </path/to/config>:/config``` volume mount. Configuration will be saved in ```</path/to/config>/.megarc``` after the first run.

To change existing saved parameters, just provide new values from the docker run command and the old values will be overwritten. Or optionally edit ```</path/to/config>/.megarc``` on the host manually.

## Author ##

* Kyle Harding <kylemharding@gmail.com>

## Credit ##

I give credit where it's due and would like to give a shoutout to the creators of the utilites/images used in this project:
* [megous](https://github.com/megous/)
