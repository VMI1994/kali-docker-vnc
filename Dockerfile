FROM kalilinux/kali-rolling:latest

# Install kali packages
RUN apt-get update
RUN apt-get -yq upgrade
RUN apt-get -yq install kali-desktop-xfce

# Install custom packages
RUN apt-get -yq install nano kali-tweaks autocutsel inetutils-ping htop btop sudo armitage figlet tightvncserver
RUN apt-get -y clean
RUN apt-get autoremove -y

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
