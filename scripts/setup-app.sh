#!/bin/bash
# Script for App Tier Instance
sudo apt-get update -y
sudo apt-get install -y python3-pip

# Install Flask and Boto3
pip3 install flask boto3

# Create a simple Flask application
sudo cat > /home/ubuntu/app.py <<EOF
from flask import Flask, jsonify
import boto3
from botocore.exceptions import ClientError

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Hello from the App Tier!",
        "location": "Private Subnet",
        "function": "Process data and communicate with S3"
    })

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Run the Flask app in the background
nohup python3 /home/ubuntu/app.py > flask.log 2>&1 &
