#!/bin/bash

source ./env.sh
url="https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.1.tar.bz2"

zux-get \
&& rm -f src/fcobjshash.h \
&& ./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-docs       \
            --docdir=/usr/share/doc/fontconfig-2.13.1 \
&& make $mkopt \
&& make install \
&& install -v -dm755 /usr/share/{man/man{1,3,5},doc/fontconfig-2.13.1/fontconfig-devel} \
&& install -v -m644 fc-*/*.1         /usr/share/man/man1 \
&& install -v -m644 doc/*.3          /usr/share/man/man3 \
&& install -v -m644 doc/fonts-conf.5 /usr/share/man/man5 \
&& install -v -m644 doc/fontconfig-devel/*  /usr/share/doc/fontconfig-2.13.1/fontconfig-devel \
&& install -v -m644 doc/*.{pdf,sgml,txt,html}  /usr/share/doc/fontconfig-2.13.1