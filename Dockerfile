FROM node:16.19.1 AS builder
WORKDIR /opt/front
COPY . .
RUN npm install
RUN npm run build:prod

FROM nginx
WORKDIR /var/www/front
COPY --from=builder /opt/front/dist/ .
COPY nginx.conf /etc/nginx/
