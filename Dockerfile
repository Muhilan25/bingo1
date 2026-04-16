FROM node:18-slim AS builder

WORKDIR /app

COPY package*.json  ./

RUN napm install

COPY . . 

RUN npm run build

# production image
FROM node:18-slim

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD [ "npm", "start" ]

