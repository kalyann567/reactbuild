FROM node:alpine as builder

# RUN addgroup -S kalyan && adduser -S kalyan -G kalyan

# USER kalyan

# WORKDIR /home/kalyan/app

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html