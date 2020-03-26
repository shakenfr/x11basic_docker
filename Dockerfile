FROM debian:jessie
VOLUME dockerfilevolume
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update \
&& apt-get install -y apt-utils \
&& apt-get install -y libreadline-dev \
&& apt-get install -y curl \
&& apt-get install -y wget \
&& apt-get install -y git \
&& apt-get install -y make \
&& apt-get install -y gcc \
&& apt-get install -y ImageMagick \
&& apt-get install -y transfig \
&& apt-get install -y vim \
&& apt-get install -y xorg-dev \
&& apt-get install -y fftw-dev \
&& apt-get install -y libasound2-dev \
&& apt-get install -y libblas-dev \
&& apt-get install -y libbluetooth-dev \
&& apt-get install -y libgmp-dev \
&& apt-get install -y libjpeg-dev \
&& apt-get install -y liblapack-dev \
&& apt-get install -y libusb-dev \
&& apt-get install -y build-essential 
#&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/kollokollo/X11Basic.git
RUN mkdir -p X11Basic/share/icons/hicolor/scalable/apps/
RUN mkdir -p X11Basic/usr/local/share/icons/hicolor/scalable/apps/
RUN mkdir -p X11Basic/usr/local/share/applications/
RUN mkdir -p X11Basic/share/applications/
RUN mkdir -p X11Basic/bin/
RUN mkdir -p X11Basic/lib/
RUN cd X11Basic/src/;./configure --prefix /X11Basic/
RUN cd X11Basic/src/;sed -i 's/..\/examples\/compiler\/ybasic/\/X11Basic\/examples\/compiler\/ybasic/g' Makefile
RUN cd X11Basic/src;make;make install
RUN cp -R /X11Basic/* /
WORKDIR /dockerfilevolume
CMD ["/bin/sh"]
