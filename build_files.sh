#!/bin/bash

echo "BUILD START"

# Add /python312/bin to PATH
export PATH="/python312/bin:$PATH"

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
python3 -m pip install -r requirements.txt

# Verify Django installation
python3 -m django --version

# Collect static files
python3 manage.py collectstatic --noinput

# Create Vercel-compatible output vercel directory
mkdir -p .vercel/output/static
cp -r staticfiles/ .vercel/output/static/

# Apply database migrations
python3 manage.py makemigrations
python3 manage.py migrate

echo "BUILD END"