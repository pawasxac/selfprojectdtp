# stage 1
FROM node:18 AS builder

WORKDIR /app

COPY app/package.json .
RUN npm install

COPY app .

# stage 2 (lebih kecil)
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app .

CMD ["node", "app.js"]

test main
