# Stage 1: Build the application
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Nginx server setup
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
