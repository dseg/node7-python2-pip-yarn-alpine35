FROM alpine:3.5
ENV WEBPACK_VERSION 2.6.1
ENV TYPESCRIPT_VERSION 2.3.2
ENV BOTO_VERSION 1.4.4
ENV YARN_VERSION 0.24.6
# Bash is required for use with BitBucket Pipelines.
# gcc, g++, python, make for building native node modules.
RUN\
 apk upgrade --update-cache --available &&\
 apk add --no-cache nodejs-current git gcc g++ make openssh python py-pip bash zip findutils curl &&\
 pip install boto3==$BOTO_VERSION &&\
 npm i -g yarn@$YARN_VERSION webpack@$WEBPACK_VERSION typescript@$TYPESCRIPT_VERSION &&\
 rm -rf /tmp/npm*
ENTRYPOINT ["/bin/bash"]
