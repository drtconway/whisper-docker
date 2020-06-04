FROM ubuntu:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y gcc g++ git make

RUN git clone https://github.com/refresh-bio/Whisper.git && \
    cd Whisper/src && \
    make && \
    cp whisper whisper-index /usr/bin && \
    cd / && \
    rm -rf Whisper && \
    apt remove -y gcc g++ git make && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*
