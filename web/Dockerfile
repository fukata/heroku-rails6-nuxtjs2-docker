FROM node:14.17-bullseye

RUN mkdir /app

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . .

CMD yarn run dev
