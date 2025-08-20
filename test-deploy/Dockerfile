# Stage 1: Build the application
FROM oven/bun:1.2.20-alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN bun install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Compile TypeScript to JavaScript
RUN pwd 
RUN ls -la 
RUN bun build /app/server.ts --compile
RUN ls -la /app

# Stage 2: Create the final, lightweight image
# Use a minimal bun image for the final container
FROM alpine:3.20

RUN apk add libstdc++

# Set the working directory
WORKDIR /app

# Copy the compiled files and package.json from the builder stage
COPY --from=builder /app/server /app/server

# Command to run the compiled application
CMD ["/app/server"]