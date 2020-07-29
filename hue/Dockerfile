FROM webratio/ant:1.9.6

MAINTAINER "Lrxcy <lrxcywq@gmail.com>"

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y ant
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsasl2-modules-gssapi-mit
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libtidy-0.99-0
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y make
RUN apt-get install -y maven
RUN apt-get install -y libldap2-dev
RUN apt-get install -y python-dev
RUN apt-get install -y python-setuptools
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libz-dev

RUN mkdir -p /opt/hue
WORKDIR /opt/hue

RUN git clone https://github.com/cloudera/hue.git ./
RUN git checkout release-4.7.0
RUN make apps

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

COPY common_header.mako /opt/hue/desktop/core/src/desktop/templates/common_header.mako

EXPOSE 8088

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8088"]