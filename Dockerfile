FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy deploy script and make it executable
COPY deploy.sh .
RUN chmod +x deploy.sh

# Copy the rest of the source code
COPY . .

# Expose the development server port
EXPOSE 5173

# Start the development server with host flag
CMD ["npm", "run", "dev", "--", "--host"]
