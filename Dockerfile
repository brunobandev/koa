FROM node:8.11.3

RUN useradd --user-group --create-home --shell /bin/false app &&\
    npm install --global npm@6.3.0

ENV HOME=/home/app

COPY package.json package-lock.json $HOME/koa/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/koa
RUN npm install --silent --progress=false

USER root
COPY . $HOME/koa
RUN chown -R app:app $HOME/*
USER app

CMD ["npm", "start"]
