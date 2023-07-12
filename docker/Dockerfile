From ubuntu:20.04

RUN apt update

RUN apt install  -y apt-transport-https curl gnupg
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" |  tee /etc/apt/sources.list.d/bazel.list
RUN apt update

RUN apt-get install -y python3-dev libncurses5-dev g++ libsm-dev make libxt-dev bazel flex bison wget git

RUN wget http://launchpadlibrarian.net/140087283/libbison-dev_2.7.1.dfsg-1_amd64.deb
RUN wget http://launchpadlibrarian.net/140087282/bison_2.7.1.dfsg-1_amd64.deb
RUN dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb
RUN dpkg -i bison_2.7.1.dfsg-1_amd64.deb
COPY vim/src/vim  /usr/bin/

ENV VIMRUNTIME=~/.vim/runtime
RUN useradd -ms /bin/bash -u 1014 shishuai
USER shishuai
WORKDIR /home/shishuai/
COPY .vim /home/shishuai/.vim
COPY .vimrc /home/shishuai/

USER root
WORKDIR /
COPY .vimrc /root/
COPY .vim   /root/.vim/

CMD ["sh","-c", "echo $HOME"]
