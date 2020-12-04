# Build Phase
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# This creates a build dir in /app folder
RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
