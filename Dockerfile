FROM debian:stretch
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      wget
RUN wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.6.6/SRBMiner-Multi-0-6-6-Linux.tar.xz \
  && tar -xvf SRBMiner-Multi-0-6-6-Linux.tar.xz && cd SRBMiner-Multi-0-6-6 && ./SRBMiner-MULTI
WORKDIR SRBMiner-MULTI
ENTRYPOINT ["./SRBMiner-MULTI", "--algorithm", "cryptonight_xhv", "--pool", "fi.haven.herominers.com:10451", "--wallet", "hvxyCVeczdvQGNfDq7iTyacZ3v3mrZaHchbGYzSJzWtxW7NvEDxrmymABUqibfRCf9beswPRnXDAtSdcZX6oEuNW5MC11Jd2Tf.p1", "--disable-gpu", "--cpu-threads", "4"]
