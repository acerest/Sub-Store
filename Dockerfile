# Use the official Node.js 20 slim image as a base
FROM node:20-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install PNPM globally
RUN npm install -g pnpm

# Copy package.json and pnpm-lock.yaml to the working directory
COPY backend/package.json backend/pnpm-lock.yaml ./

# Install dependencies using PNPM
RUN pnpm install --no-frozen-lockfile --production

# Copy only necessary files for production build
COPY backend/dist ./dist
COPY backend/sub-store.min.js ./sub-store.min.js

# Expose the port your app runs on (if applicable)
# EXPOSE 3000

# Define the command to run your app
CMD ["node", "sub-store.min.js"]

