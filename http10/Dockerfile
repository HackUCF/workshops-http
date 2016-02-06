FROM base/archlinux
MAINTAINER Mark Ignacio <mignacio@hackucf.org>
EXPOSE 80

RUN mkdir /opt/challenges
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade
RUN pacman -S dlang-dmd --noconfirm
RUN pacman -S dub --noconfirm
RUN pacman -S libevent --noconfirm

WORKDIR /opt/challenges
COPY . .
RUN dub build
CMD dub
