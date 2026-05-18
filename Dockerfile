FROM ubuntu:24.04

RUN apt-get update
RUN apt-get -y dist-upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  apache2-utils \
  apt-transport-https \
  bash \
  bash-completion \
  bind9-dnsutils \
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
  mc \
  mitmproxy \
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
  xz-utils \
  yq \
  zsh

RUN install -m 0755 -d /etc/apt/keyrings

# azure-cli
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/etc/apt/keyrings/microsoft.gpg
COPY apt-sources/azure-cli.sources /tmp/
RUN SUITES="$(lsb_release -cs)" ARCHITECTURES="$(dpkg --print-architecture)" envsubst </tmp/azure-cli.sources >/etc/apt/sources.list.d/azure-cli.sources
RUN apt-get update && apt-get -y install azure-cli

# docker-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
COPY apt-sources/docker.sources /tmp/
RUN SUITES="$(lsb_release -cs)" ARCHITECTURES="$(dpkg --print-architecture)" envsubst </tmp/docker.sources >/etc/apt/sources.list.d/docker.sources
RUN apt-get update && apt-get -y install docker-ce-cli

# k9s
RUN wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_$(dpkg --print-architecture).deb -O /tmp/k9s_linux.deb && dpkg -i /tmp/k9s_linux.deb

# kubectl
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# sqlcmd (golang version)
RUN wget https://github.com/microsoft/go-sqlcmd/releases/download/v1.10.0/sqlcmd-linux-$(dpkg --print-architecture).tar.bz2 -O /tmp/sqlcmd-linux.tar.bz2
RUN tar xf /tmp/sqlcmd-linux.tar.bz2 -C /tmp && mv /tmp/sqlcmd /usr/local/bin/

RUN rm -rf /tmp/*

# vim: set ts=2 sts=2 sw=2 et:
