FROM shoothzj/base

WORKDIR /opt

ENV APISIX_VERSION '3.0.0'

RUN curl https://raw.githubusercontent.com/apache/apisix/master/utils/install-dependencies.sh -sL | bash - && \
wget https://downloads.apache.org/apisix/${APISIX_VERSION}/apache-apisix-${APISIX_VERSION}-src.tgz && \
mkdir -p apisix && \
tar zxvf apache-apisix-${APISIX_VERSION}-src.tgz -C apisix && \
rm -rf apache-apisix-${APISIX_VERSION}-src.tgz && \
cd apisix && \
make deps && \
make install

WORKDIR /opt/apisix
