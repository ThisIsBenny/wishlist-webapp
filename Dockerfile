# Build artifacts
FROM node:lts as builder

RUN mkdir /app
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm set-script prepare ""
RUN npm ci

ENV NODE_ENV=production

COPY . /app/
RUN npm run build

FROM node:lts

LABEL maintainer="github.com/thisisbenny"

ENV NODE_ENV=production
ENV PORT=5000
ENV DATABASE_URL="file:../data/data.db"

RUN mkdir /app
WORKDIR /app
RUN mkdir data

COPY package.json package-lock.json /app/
COPY ./prisma /app/prisma
RUN npm set-script prepare ""
RUN npm ci
COPY --from=builder /app/dist /app

EXPOSE 5000

ENTRYPOINT npx prisma migrate deploy && node api/server.js
