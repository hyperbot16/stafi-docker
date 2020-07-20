FROM debian:buster-slim

RUN apt-get update && apt-get install -y curl

COPY stafi-node /opt/stafi-node

WORKDIR /opt/stafi-node

# run init.sh script
RUN set -eux; \
    /opt/stafi-node/scripts/init.sh

#  Add cargo to path env
ENV PATH="/root/.cargo/bin:$PATH"

# build rust script 
RUN set -eux; \
    cargo build --release

EXPOSE 30333/tcp
EXPOSE 5353/udp
EXPOSE 3573/udp

ENTRYPOINT [ "./target/release/stafi" ]