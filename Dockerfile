FROM node:18

WORKDIR /app

# Copy package files first (for caching npm install)
COPY strapi-app/package.json .
COPY strapi-app/package-lock.json .

# Install dependencies using npm
RUN npm install

# Copy the rest of the application
COPY strapi-app/. .

# Build Strapi (optional for production builds)
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
