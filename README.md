
## brother\_ql\_web\_docker

This repository contains Dockerfiles to create images with deployments
of [brother\_ql\_web](https://github.com/pklaus/brother_ql_web), a web interface
to print labels with Brother's QL-series label printers.

Ready to use images can be found on Docker hub: [pklaus/brother\_ql\_web](https://hub.docker.com/r/pklaus/brother_ql_web/).

### Available images / tags

There are multiple Dockerfiles in the repository deriving from different base images.
As I like to use Raspberry Pis to run the web interface, quite some work went
into the versions deriving from the resin/raspberry-pi-[...] base images.

### Usage

An example for running the application:

    docker run \
      --detach \
      --rm \
      --device=/dev/usb/lp0 \
      --publish 8013:8013 \
      pklaus/brother_ql_web:resin-raspberry-pi-alpine-python-3_5f1447d \
      ./brother_ql_web.py --model QL-700 file:///dev/usb/lp0

Here, we use the image `pklaus/brother_ql_web:resin-raspberry-pi-alpine-python-3_5f1447d`
made for the Raspberry Pi 1 / Zero / Zero W.

### Compressed Image Sizes

Here is a list of images sizes for the resulting docker images, sorted by compressed image size:

Tag Name                                    | Compressed Size | Unpacked Size
--------------------------------------------|-----------------|---------------
for x86\_64 CPUs:
alpine-3.7\_5f1447d                         |  42 MB          | 101 MB
python-3-alpine\_5f1447d                    | 117 MB          | 307 MB
opensuse-42.3\_5f1447d                      | 142 MB          | 334 MB
python-3\_5f1447d                           | 301 MB          | 737 MB
for Raspberry Pis:
resin-raspberry-pi-alpine-3.6\_5f1447d      |  56 MB          | 149 MB
resin-raspberry-pi2-alpine-3.6\_5f1447d     |  58 MB          | 155 MB
resin-raspberrypi3-alpine-3.6\_5f1447d      |  58 MB          | 155 MB
resin-raspberry-pi-alpine-python-3\_5f1447d | 177 MB          | 525 MB
resin-raspberry-pi-python-3\_5f1447d        | 237 MB          | 642 MB

As a result, I highly recommend the `alpine-3.7` versions for `x86_64`
and the `resin-raspberry-pi-alpine-3.6` version for the Raspberry Pi!
