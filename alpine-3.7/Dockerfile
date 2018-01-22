FROM alpine:3.7

RUN apk add --update --no-cache \
    build-base \
    freetype-dev \
    jpeg-dev \
    python3 \
    python3-dev \
    git \
    freetype \
    fontconfig \
    ttf-dejavu \
  && pip3 --no-cache-dir install pillow jinja2 bottle

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
