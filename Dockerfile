FROM  node:carbon

COPY . /code

RUN yarn global add bower

WORKDIR /code
RUN yarn --pure-lockfile --no-cache --network-concurrency 1 && bower install --allow-root

ENTRYPOINT ember server
