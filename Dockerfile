FROM node:20

WORKDIR /app

COPY ./strapi-app ./

RUN npm install

EXPOSE 1337

CMD ["npm", "run", "develop"]
