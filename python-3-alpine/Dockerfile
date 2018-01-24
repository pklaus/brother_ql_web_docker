FROM python:3-alpine

RUN apk add --update --no-cache --virtual .build-deps  \
    build-base \
    freetype-dev \
    git \
    jpeg-dev \
    zlib-dev

RUN apk add --update --no-cache \
    fontconfig \
    freetype \
    jpeg \
    ttf-dejavu \
    zlib \
  && pip install --no-cache-dir bottle jinja2 pillow

RUN git clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip install --no-cache-dir -r requirements.txt

RUN apk del .build-deps

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
