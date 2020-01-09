FROM dwmkerr/terraform-ci:0.3.4
USER root
RUN mkdir /root/.npm-global
ENV PATH=/root/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/root/.npm-global
ENV NPM_CONFIG_USER=root
RUN apt-get update && apt-get -y install curl gnupg \
    && curl -sL https://deb.nodesource.com/setup_11.x  | bash - \
    && apt-get -y install nodejs \
    && npm install -g merge-convert-csv-to-json@1.1.0
COPY main.tf /tmp/main.tf