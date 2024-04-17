# Use an official Node runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Bundle app source
COPY . .

# Build the application
RUN npm run build

# Start the app using a simple node server
CMD ["npx", "serve", "-s", "build", "-l", "tcp://0.0.0.0:1995"]