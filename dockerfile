FROM python:3.12-slim-bookworm

WORKDIR /app

# Install dependencies (cached as long as lockfiles are unchanged)
COPY requirements.txt pyproject.toml* setup.py* Pipfile* Pipfile.lock* ./
RUN pip install -r requirements.txt && pip install gunicorn

# Copy application source
COPY ./ ./

# Start the app
CMD gunicorn --bind 0.0.0.0:8000  config.wsgi:application 