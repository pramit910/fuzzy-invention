# Use official Python image
FROM python:3.13-alpine

# Install uv (ultra-fast Python package manager)
RUN pip install --no-cache-dir uv

# Set work directory
WORKDIR /app

# Copy pyproject.toml and optional lock file
COPY pyproject.toml ./
COPY pyproject.lock ./

# Install dependencies using uv
RUN uv pip install --frozen

# Copy the rest of the application code
COPY . .

# Set default command (adjust as needed)
CMD ["python", "-m", "app.py"]