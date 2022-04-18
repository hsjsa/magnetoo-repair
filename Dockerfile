FROM rootgamer/magn3to:latest
RUN su
RUN apt update
RUN apt upgrade -y
RUN apt install sudo
RUN echo "Sudo :- it's ON"
RUN sudo apt install wget curl -y
RUN sudo fallocate -l 2g /mnt/9GiB.swap
RUN sudo chmod 600 /mnt/9GiB.swap
RUN sudo mkswap /mnt/9GiB.swap
RUN echo '/mnt/9GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab
RUN sudo apt install preload
RUN sudo apt install tlp tlp-rdw
COPY . .
CMD ["bash","start.sh"]
