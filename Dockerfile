FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for pycryptodome and other builds
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port (Railway provides the PORT env var)
EXPOSE 20333

# Start the bot
CMD ["python", "app.py"]