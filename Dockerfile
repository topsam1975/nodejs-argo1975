FROM node:20-alpine3.20

WORKDIR /app

COPY package.json ./

RUN apk update && \
    apk add --no-cache curl gcompat && \
    npm install --production

COPY . .

EXPOSE 3000/tcp

CMD ["node", "index.js"]
