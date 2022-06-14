FROM node:buster

RUN mkdir /node-red

WORKDIR /node-red

RUN npm install

COPY ./sources/package.json .
COPY ./sources/settings.js .
COPY ./sources/flows.json .

EXPOSE 1880
ENTRYPOINT ["./node_modules/.bin/node-red", "-s", "settings.js", "./flows.json"]

