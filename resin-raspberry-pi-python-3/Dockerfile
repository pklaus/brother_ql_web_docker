FROM resin/raspberry-pi-python:3

# https://docs.resin.io/runtime/resin-base-images/#resin-xbuild-qemu
RUN [ "cross-build-start" ]

RUN apt-get update \ 
  && apt-get install libfreetype6-dev \
  && rm -f /var/cache/apt/archives/*.deb
RUN pip install pillow jinja2 bottle

#ADD my_script.py /
RUN git  clone https://github.com/pklaus/brother_ql_web.git
WORKDIR ./brother_ql_web
RUN pip install --no-cache-dir -r requirements.txt

RUN [ "cross-build-end" ]

EXPOSE 8013

#CMD [ "brother_ql_create", "--help" ]
CMD [ "./brother_ql_web.py", "--model", "QL-700", "file:///dev/usb/lp0" ]
