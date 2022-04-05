FROM node:17

WORKDIR /app
COPY package.json /app/package.json
COPY pnpm-lock.yaml /app/pnpm-lock.yaml
COPY src/ /app/src

RUN npm i -g pnpm

RUN pnpm install

RUN addgroup --gecos 1001 --system nodejs
RUN adduser --system reacjilator --uid 1001
USER reacjilator

EXPOSE 8080
CMD node src/index.js