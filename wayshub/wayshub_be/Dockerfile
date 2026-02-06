# Stage 1: Build
FROM node:10-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Stage 2: Runtime
FROM node:10-alpine
WORKDIR /app
RUN npm install -g pm2 sequelize-cli
COPY --from=build /app /app
EXPOSE 5000
CMD ["pm2-runtime", "start", "npm", "--", "start"]
