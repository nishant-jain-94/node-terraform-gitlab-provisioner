FROM dwmkerr/terraform-ci:0.3.4
RUN apt-get update && apt-get -y install curl gnupg \
    && curl -sL https://deb.nodesource.com/setup_11.x  | bash - \
    && apt-get -y install nodejs \
    && npm install -g merge-convert-csv-to-json@1.1.0
COPY main.tf /tmp/main.tf