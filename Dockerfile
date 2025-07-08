# Use a lightweight Node.js base image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
# to leverage Docker's layer caching for dependency installation
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your Express app listens on (e.g., 3000)
EXPOSE 3000

# Define the command to run your application when the container starts
CMD ["npm", "start"]
