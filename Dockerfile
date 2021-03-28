FROM node:alpine
WORKDIR '/web'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /web/build /usr/share/nginx/html