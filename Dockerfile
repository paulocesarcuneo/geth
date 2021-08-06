FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes software-properties-common
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install --yes geth puppeth
RUN apt-get install --yes gnupg apt-transport-https gpg-agent curl ca-certificates nodejs npm 

RUN curl -LSs https://raw.githubusercontent.com/gochain/web3/master/install.sh | sh
RUN apt-get install clef
RUN adduser --disabled-login --gecos "" eth

USER eth
WORKDIR /home/eth
COPY --chown=eth:eth . .

CMD ./startup  

