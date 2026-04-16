FROM ubuntu:24.04

RUN apt-get update
RUN apt-get -y dist-upgrade

RUN apt-get -y install \
  apache2-utils \
  apt-transport-https \
  bash \
  bash-completion \
  bind9-host \
  bind9-utils \
  build-essential \
  bzip2 \
  ca-certificates \
  coreutils \
  curl \
  fping \
  gettext \
  git \
  gpg \
  gping \
  gzip \
  findutils \
  htop \
  iftop \
  ipcalc \
  iperf \
  iproute2 \
  iptables \
  jq \
  ldnsutils \
  lsb-release \
  mariadb-client \
  masscan \
  moreutils \
  mosh \
  mtr-tiny \
  ncat \
  net-tools \
  netcat-openbsd \
  nethogs \
  nload \
  nftables \
  ngrep \
  nmap \
  oathtool \
  openssh-client \
  openssh-server \
  openssl \
  postgresql-client \
  procps \
  pwgen \
  python3 \
  redis \
  ripgrep \
  rsync \
  socat \
  speedtest-cli \
  ssl-cert \
  subnetcalc \
  sudo \
  tcpdump \
  tcptraceroute \
  telnet \
  traceroute \
  tree \
  tshark \
  unzip \
  vim \
  wget \
  yq \
  zsh

# vim: set ts=2 sts=2 sw=2 et:
