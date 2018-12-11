FROM  node:carbon

COPY . /code
COPY .env /code/.env

RUN yarn global add bower

WORKDIR /code
RUN yarn --pure-lockfile --no-cache --network-concurrency 1
RUN bower install --allow-root

ENV GIT_DIR=/tmp

WORKDIR /code/lib/exp-player
RUN yarn --pure-lockfile --no-cache --network-concurrency 1 && bower install --allow-root

WORKDIR /code/lib/exp-models
RUN yarn --pure-lockfile --no-cache --network-concurrency 1 && bower install --allow-root

WORKDIR /code

RUN ./node_modules/.bin/ember g ember-cli-sass

CMD ["./node_modules/.bin/ember", "s"]
