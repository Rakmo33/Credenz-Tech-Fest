#!/bin/bash
# Script to create .env file if it doesn't exist

if [ ! -f .env ]; then
    echo "Creating .env file..."
    cat > .env << EOF
# Backend API URL
# Replace this with your backend API URL or use http://localhost:8000 for local development
REACT_APP_API_URL=http://localhost:8000
EOF
    echo ".env file created successfully!"
else
    echo ".env file already exists. Skipping..."
fi

