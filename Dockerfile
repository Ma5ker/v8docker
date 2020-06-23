FROM phusion/baseimage:master-amd64

LABEL author="ma5ker"
LABEL version="1.0"
LABEL description="V8 Engine docker for lab testing"

ENV DEBIAN_FRONTEND noninteractive

ENV TZ Asia/Shanghai

RUN apt-get -y update && \
    apt install git -y

RUN git clone --depth 1 https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

WORKDIR /V8/test/


RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && mv depot_tools /V8/
ENV PATH "$PATH:/V8/depot_tools"

RUN gclient && cd /V8 && fetch v8

RUN rm -rf ~/.gdbinit
RUN echo "source /V8/v8/tools/gdbinit" >> ~/.gdbinit
RUN echo "source /V8/v8/tools/gdb-v8-support.py" >> ~/.gdbinit
RUN echo "source /pwndbg/gdbinit.py" >> ~/.gdbinit

CMD ["/sbin/my_init"]
