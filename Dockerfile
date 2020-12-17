FROM node:14-slim as build
RUN mkdir -p src/app
WORKDIR src/app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:14-alpine
RUN mkdir -p src/app
WORKDIR src/app
COPY --from=build src/app .
ENTRYPOINT ["node"]
CMD ["src/app.js"]
