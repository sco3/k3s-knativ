# Stage 1: Build the application
FROM oven/bun:1.1.18 as builder

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN bun install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Compile TypeScript to JavaScript
RUN build 

# Stage 2: Create the final, lightweight image
# Use a minimal bun image for the final container
FROM oven/bun:1.1.18

# Set the working directory
WORKDIR /app

# Copy the compiled files and package.json from the builder stage
COPY --from=builder /app/dist ./dist
COPY package.json .

# Command to run the compiled application
CMD ["bun", "build", "server.ts"]