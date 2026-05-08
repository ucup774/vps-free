FROM ubuntu:latest

# Install SSH & Tools dasar
RUN apt-get update && apt-get install -y \
    openssh-server \
    wget \
    curl \
    git \
    screen \
    sudo

# Setting Password Root jadi "asu"
RUN echo 'root:asu' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Port SSH
EXPOSE 22

# Jalankan SSH pas startup
CMD ["/usr/sbin/sshd", "-D"]
