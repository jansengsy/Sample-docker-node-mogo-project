# Use node image - set to version 10 and not latest to avoid breaking changes
FROM node:10

# Set working dir (where our app lives in the container)
WORKDIR /usr/src/app

# Copy in package.json and package-lock.json (Using wildcard)
COPY package*.json ./

# Run npm install
RUN npm install

# Copy everything else into the container - Syntax: Copy from . (where the dockerfile lives) to . (which is out WORKDIR)
COPY . .

# Expose port 3000, as we run on this port (set in index.js line 36)
EXPOSE 3000

# Run a command. We pass this as an array as there are two parts. This is the same as: "npm start"
CMD ["npm", "start"]