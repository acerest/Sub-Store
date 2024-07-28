FROM node:16-alpine

WORKDIR /app

COPY . .

RUN mkdir config

EXPOSE 3000

CMD SUB_STORE_DATA_BASE_PATH=/app/config node sub-store.bundle.js
