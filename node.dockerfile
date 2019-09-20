FROM ubuntu:xenial

VOLUME [ "./:/var/www:cached" ]

WORKDIR /var/www

RUN apt-get update
RUN apt-get install --yes curl git zip build-essential
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install --yes nodejs

# use node 10.14.2
RUN npm i -g n
RUN n 10.14.2

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

CMD ["bash"]
