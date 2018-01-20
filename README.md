
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
