FROM alpine:3.5
ENV WEBPACK_VERSION 2.2.1
ENV TYPESCRIPT_VERSION 2.2.1
ENV BOTO_VERSION 1.3.0
ENV YARN_VERSION 0.21.3
# Bash is required for use with BitBucket Pipelines.
# gcc, g++, python, make for building native node modules.
RUN\
 apk upgrade --update-cache --available &&\
 apk add --no-cache nodejs-current git gcc g++ make openssh python py-pip bash zip findutils &&\
 pip install boto3==$BOTO_VERSION &&\
 npm i -g yarn@$YARN_VERSION webpack@$WEBPACK_VERSION typescript@$TYPESCRIPT_VERSION &&\
 rm -rf /tmp/npm*
ENTRYPOINT ["/bin/bash"]
