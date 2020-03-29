FROM continuumio/miniconda3:4.8.2
LABEL maintainer="Joan Font <joanfont@gmail.com>"

WORKDIR /demucs

RUN apt-get update && \
    apt-get install -y curl zip && \
    curl -L -o code.zip https://github.com/facebookresearch/demucs/archive/master.zip && \
    unzip code.zip && \
    rm code.zip && \
    mv demucs-master/* . && \
    rm -fr demucs-master && \
    apt-get remove --purge -y curl zip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /demucs

RUN conda init bash
RUN conda env update -f environment-cpu.yml

RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate demucs" >> ~/.bashrc

VOLUME ["/demucs/models"]
VOLUME ["/demucs/separated"]

ADD entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]