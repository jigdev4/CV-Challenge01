# Use an official node image as the base for building the application
FROM node:14 as build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Use an official node image to serve the application
FROM node:14 as production-stage

# Install serve globally
RUN npm install -g serve

# Copy the build output to the final directory
COPY --from=build-stage /app/dist /app

# Expose the port the app runs on
EXPOSE 3000

# Start the app using serve
CMD ["serve", "-s", "/app", "-l", "3000"]
