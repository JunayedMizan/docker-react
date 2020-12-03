# Build Phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# This creates a build dir in /app folder
RUN npm run build

# Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
