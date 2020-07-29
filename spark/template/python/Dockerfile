FROM lrxcywq/spark-submit:3.0.0

LABEL maintainer="Lrxcy <lrxcywq@gmail.com>"

COPY template.sh /

# Copy the requirements.txt first, for separate dependency resolving and downloading
ONBUILD COPY requirements.txt /app/
ONBUILD RUN cd /app \
      && pip3 install -r requirements.txt

# Copy the source code
ONBUILD COPY . /app

CMD ["/bin/bash", "/template.sh"]
