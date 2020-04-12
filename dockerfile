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
