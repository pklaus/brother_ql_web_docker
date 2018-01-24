FROM alpine:3.7

ARG GIT_REF=master

RUN apk add --update --no-cache --virtual .build-deps  \
    curl

RUN apk add --update --no-cache \
    fontconfig \
    py3-bottle \
    py3-jinja2 \
    py3-pillow \
    python3 \
    ttf-dejavu

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN curl -sL https://github.com/pklaus/brother_ql_web/archive/${GIT_REF}.tar.gz | tar xz \
 && mv brother_ql_web-${GIT_REF} brother_ql_web
WORKDIR ./brother_ql_web
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
