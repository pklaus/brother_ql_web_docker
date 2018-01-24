FROM resin/raspberry-pi-alpine:3.6
# or for the Raspberry Pi 2/3 (identical):
#FROM resin/raspberry-pi2-alpine:3.6
#FROM resin/raspberrypi3-alpine:3.6

# https://docs.resin.io/runtime/resin-base-images/#resin-xbuild-qemu
RUN [ "cross-build-start" ]

RUN apk add --update --no-cache --virtual .build-deps  \
    curl

RUN apk add --update --no-cache \
    python3 \
    fontconfig \
    py3-pillow \
    py3-jinja2 \
    py3-bottle \
    ttf-dejavu

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN curl -sL https://github.com/pklaus/brother_ql_web/archive/${GIT_REF}.tar.gz | tar xz \
 && mv brother_ql_web-${GIT_REF} brother_ql_web
WORKDIR ./brother_ql_web
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps

EXPOSE 8013

RUN [ "cross-build-end" ]

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
