FROM node:current-alpine3.16

RUN mkdir /node-red

WORKDIR /node-red

RUN npm install node-red --save

COPY ./sources/package.json .
COPY ./sources/settings.js .
COPY ./sources/flows.json .

WORKDIR /root/.node-red
COPY ./sources/package.json .

EXPOSE 1880
ENTRYPOINT ["./node_modules/.bin/node-red", "-s", "settings.js", "./flows.json"]

