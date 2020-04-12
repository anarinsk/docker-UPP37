# Source 
FROM ubuntu:18.04

# Set for all apt-get install, must be at the very beginning of the Dockerfile.
ENV DEBIAN_FRONTEND noninteractive
# Non-interactive modes get set back.
ENV DEBIAN_FRONTEND newt

# Change mirror 
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list && sed -i 's/extras.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# apt update & upgrade 
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget

# Installing python
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y python3.7 && update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Installing pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py

# Installing python packages 
COPY . ~
WORKDIR ~
RUN pip install -r requirements.txt
