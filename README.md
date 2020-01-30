
## brother\_ql\_web\_docker

This repository contains Dockerfiles to create images with deployments
of [brother\_ql\_web](https://github.com/pklaus/brother_ql_web), a web interface
to print labels with Brother's QL-series label printers.

Ready to use images can be found on Docker hub: [pklaus/brother\_ql\_web](https://hub.docker.com/r/pklaus/brother_ql_web).

### Available images / tags

The image created are based on alpine and built for multiple
platforms/architectures. Your docker daemon will automatically
pick a suitable version when pulling the image.
Running this on a Raspberry Pi works like a charm!

### Usage

An example for running the application:

    docker run \
      --detach \
      --rm \
      --device=/dev/usb/lp0 \
      --publish 8013:8013 \
      pklaus/brother_ql_web:latest \
      ./brother_ql_web.py --model QL-700 file:///dev/usb/lp0

Here, we use the image `pklaus/brother_ql_web:alpine-rpi-latest
made for Raspberry Pi.
