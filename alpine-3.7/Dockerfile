FROM alpine:3.7

RUN apk add --update --no-cache --virtual .build-deps  \
    git

RUN apk add --update --no-cache \
    python3 \
    fontconfig \
    py3-pillow \
    py3-jinja2 \
    py3-bottle \
    ttf-dejavu

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
