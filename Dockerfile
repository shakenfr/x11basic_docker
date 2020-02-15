FROM debian:jessie
VOLUME dockerfilevolume
RUN apt-get update \
&& apt-get install -y curl \
&& apt-get install -y wget \
&& apt-get install -y make \
&& apt-get install -y gcc \
&& apt-get install -y ImageMagick \
&& apt-get install -y transfig \
&& apt-get install -y vim \
&& apt-get install -y build-essential 
#&& rm -rf /var/lib/apt/lists/*
RUN mkdir /xbasic
RUN wget https://sourceforge.net/projects/x11-basic/files/X11-Basic-src/1.26/X11Basic-1.26.tar.gz
RUN mkdir -p /xbasic/share/icons/hicolor/scalable/apps/
RUN mkdir -p /xbasic/usr/local/share/icons/hicolor/scalable/apps/
RUN mkdir -p /xbasic/usr/local/share/applications/
RUN mkdir -p /xbasic/share/applications/
RUN mkdir -p /xbasic/bin/
RUN mkdir -p /xbasic/lib/
RUN gzip -d X*
RUN tar xvf X*
RUN rm -f X11Basic-1.26.tar
RUN cd X11Basic-1.26/;./configure --prefix /xbasic/
RUN cd X11Basic-1.26/;sed -i 's/..\/examples\/compiler\/ybasic/\/X11Basic-1.26\/examples\/compiler\/ybasic/g' Makefile
RUN cd X11Basic-1.26/;make;make install
RUN cp -R /xbasic/* /
WORKDIR /dockerfilevolume
CMD ["/bin/sh"]
