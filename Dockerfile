# Use the official Node.js runtime as the base image
FROM node:14

# Set the working directory in the Docker image to /app
WORKDIR /app

# Copy package.json and package-lock.json into the image
COPY package*.json ./

# Install dependencies in the image
RUN npm install

# Copy the rest of the application code into the image
COPY client/ ./client
COPY server/ ./server
COPY webpack.config.js .

# Specify that the application listens on port 3000
EXPOSE 3000

# The command to run the application
CMD [ "node", "client/index.js" ]
