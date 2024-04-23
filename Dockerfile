FROM alpine:latest

# Install Zola
RUN apk add --no-cache zola git

# Copy the Zola blog
COPY . /app
WORKDIR /app

# Initialize and update the theme submodule
RUN git submodule init
RUN git submodule update

# Build the Zola blog
RUN zola build

# Expose the Zola blog server port
EXPOSE 8080

# Set the command to run the Zola blog server
CMD ["zola", "serve", "--interface", "0.0.0.0", "--port", "8080"]

