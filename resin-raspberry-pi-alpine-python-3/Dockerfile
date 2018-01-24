FROM resin/raspberry-pi-alpine-python:3

# https://docs.resin.io/runtime/resin-base-images/#resin-xbuild-qemu
RUN [ "cross-build-start" ]

RUN apk add --update --no-cache --virtual .build-deps  \
    build-base \
    freetype-dev \
    git

RUN apk add --update --no-cache \
    freetype \
    ttf-dejavu \
  # we have to install the packages with pip. We can't use the ones
  # provided by the system as we are using a custom Python installation:
  && pip install --no-cache-dir bottle jinja2 pillow

RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip install --no-cache-dir -r requirements.txt

RUN [ "cross-build-end" ]

RUN apk del .build-deps

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
