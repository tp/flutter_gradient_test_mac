FROM ubuntu:21.10

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa wget openssh-client

RUN git clone -b 2.5.3 --depth=1 https://github.com/flutter/flutter.git

ENV PATH "$PATH:/flutter/bin"

RUN flutter doctor

WORKDIR /app

ADD test.sh /test.sh
RUN chmod +x /test.sh
ENTRYPOINT ["/test.sh"]
