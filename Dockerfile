FROM mcr.microsoft.com/playwright/python:v1.45.0-jammy

WORKDIR /app

# Install python dependencies
RUN pip install --no-cache-dir fastapi uvicorn camoufox[fetch] loguru psutil playwright

# Download Camoufox assets and Playwright browser binaries
RUN python -m camoufox fetch && playwright install chromium

# Copy the server files
COPY . .

# Expose the API port
EXPOSE 8001

# Start the API server
CMD ["python", "api_server.py"]
