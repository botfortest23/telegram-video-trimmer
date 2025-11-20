# Start from a stable, slim Python image
FROM python:3.11-slim

# Install system dependencies
# Install FFmpeg and necessary libraries for media processing
RUN apt-get update && \
    apt-get install -y ffmpeg libsm6 libxext6 && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the bot code
COPY . .

# Set the command to run when the container starts
CMD ["python", "bot.py"]