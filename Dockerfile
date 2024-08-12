FROM quay.io/eypzgod/izumi:latest

# Clone the repo
RUN git clone https://github.com/sataniceypz/Izumi-v3 /root/bot/

WORKDIR /root/bot/

# Install dependencies
RUN yarn install

# Health check to ensure the bot is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1

# Start the bot
CMD ["npm", "start"]
