FROM telegraf:latest

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list &&\
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common\
    snmp snmp-mibs-downloader &&\
    rm -rf /var/lib/apt/lists/* &&\
    wget https://bootstrap.pypa.io/get-pip.py &&\
    python3 get-pip.py --prefix=/usr/local &&\
    rm -rf get-pip.py &&\
    pip install requests unidecode

CMD ["telegraf"]