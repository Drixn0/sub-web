# ---- Dependencies ----
FROM node:20-alpine AS build
LABEL maintainer='Drixn <i@drixn.com>'
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM nginx:1.24-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
