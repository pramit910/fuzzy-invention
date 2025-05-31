# api_service/Dockerfile

# Use a lean base image for your application
FROM python:3.12-alpine-bookworm

# Set working directory for the API service
WORKDIR /app

# Install API service specific dependencies first to leverage caching
# This assumes you have an api_service/requirements.txt
COPY api_service/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the core GenAI logic from src/
# Note: The 'src' directory from the root will be copied into the image's /app/src
COPY src/ ./src/

# Copy the API service code
COPY api_service/ ./api_service/

# Set the PYTHONPATH to include your src directory if needed for imports like `from src.core import ...`
ENV PYTHONPATH=/app:$PYTHONPATH

# Expose the port your FastAPI/Flask app listens on
EXPOSE 8000

# Command to run the API service
CMD ["uvicorn", "api_service.app:app", "--host", "0.0.0.0", "--port", "8000"]