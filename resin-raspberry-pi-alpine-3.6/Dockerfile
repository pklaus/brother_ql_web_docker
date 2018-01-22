FROM resin/raspberry-pi-alpine:3.6

# https://docs.resin.io/runtime/resin-base-images/#resin-xbuild-qemu
RUN [ "cross-build-start" ]

RUN apk add --update --no-cache \
    python3 \
    git \
    fontconfig \
    py3-pillow \
    py3-jinja2 \
    py3-bottle \
    ttf-dejavu

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8013

RUN [ "cross-build-end" ]

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
