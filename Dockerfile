FROM node:buster

RUN mkdir /node-red

WORKDIR /node-red

COPY ./sources/package.json .
COPY ./sources/settings.js .
COPY ./sources/flows.json .
COPY ./sources/flows_cred.json .
RUN npm install

EXPOSE 1880
ENTRYPOINT ["./node_modules/.bin/node-red", "-s", "settings.js", "./flows.json"]

