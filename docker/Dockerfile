FROM node:18

WORKDIR /app

# Copy everything from strapi-app/ into container
COPY ../strapi-app/ .

RUN npm install

RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
