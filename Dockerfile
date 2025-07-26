# Use the official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json from the strapi folder
COPY strapi/package.json ./
COPY strapi/package-lock.json ./

# Install dependencies
RUN npm install

# Copy the entire Strapi app source code
COPY strapi/. .

# Build the Strapi app
RUN npm run build

# Expose the port Strapi runs on
EXPOSE 1337

# Start the app
CMD ["npm", "start"]
