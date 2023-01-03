FROM node:16-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g 
COPY . .
RUN yarn install
EXPOSE 1337
CMD ["yarn", "develop"]