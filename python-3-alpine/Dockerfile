FROM python:3-alpine

RUN apk add --update --no-cache \
    freetype-dev \
    jpeg-dev \
    build-base \
    git \
    ttf-dejavu \
    zlib-dev \
    fontconfig \
  && pip install pillow jinja2 bottle
RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
