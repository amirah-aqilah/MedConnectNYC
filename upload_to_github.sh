#!/bin/bash

# MedConnect NYC - Automated GitHub Upload Script for macOS/Linux
# This script uploads your project to GitHub automatically

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║     MedConnect NYC - GitHub Upload Script (macOS/Linux)        ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed!"
    echo ""
    echo "Install Git:"
    echo "  macOS: brew install git"
    echo "  Linux: sudo apt-get install git"
    echo ""
    exit 1
fi

echo "✓ Git is installed"
echo ""

# Get GitHub credentials
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your GitHub email: " GITHUB_EMAIL
read -p "Enter your GitHub Personal Access Token: " GITHUB_TOKEN
read -p "Enter repository name (default: medconnect-nyc): " REPO_NAME

REPO_NAME=${REPO_NAME:-medconnect-nyc}

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                  CONFIGURATION SUMMARY                        ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "GitHub Username: $GITHUB_USERNAME"
echo "GitHub Email: $GITHUB_EMAIL"
echo "Repository Name: $REPO_NAME"
echo ""
echo "✓ Press Enter to continue or Ctrl+C to cancel..."
read

# Configure Git
echo "✓ Configuring Git..."
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Initialize repository
echo "✓ Initializing local repository..."
git init

# Add all files
echo "✓ Adding all files..."
git add .

# Create initial commit
echo "✓ Creating first commit..."
git commit -m "Initial commit: MedConnect NYC healthcare platform

- Flask backend with PostgreSQL & MongoDB integration
- Emergency services (ambulance dispatch, hospital lookup)
- Consultations (telemedicine & in-person)
- Pharmacy services with order tracking
- Beautiful responsive frontend
- Docker containerization
- GitHub Actions CI/CD pipeline
- Complete documentation"

# Set main branch
echo "✓ Setting up main branch..."
git branch -M main

# Add remote repository
echo "✓ Connecting to GitHub..."
GITHUB_URL="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
git remote add origin "$GITHUB_URL"

# Push to GitHub
echo "✓ Uploading to GitHub (this may take a minute)..."
if git push -u origin main; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                   ✅ SUCCESS!                                   ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Your code is now on GitHub!"
    echo ""
    echo "Visit: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
    echo ""
    echo "Next steps:"
    echo "1. Go to the URL above"
    echo "2. Click Settings → Secrets and variables → Actions"
    echo "3. Add GitHub Secrets for Heroku deployment (see docs)"
    echo "4. Your app will auto-deploy!"
    echo ""
    echo "✓ Project uploaded successfully!"
    echo ""
else
    echo ""
    echo "❌ Upload failed!"
    echo ""
    echo "Possible issues:"
    echo "1. GitHub username is incorrect"
    echo "2. Personal Access Token is incorrect or expired"
    echo "3. Repository doesn't exist on GitHub"
    echo "4. Repository is not empty"
    echo ""
    echo "To fix:"
    echo "1. Go to https://github.com/new"
    echo "2. Create a NEW repository named '${REPO_NAME}'"
    echo "3. Leave it empty (don't add README)"
    echo "4. Run this script again"
    echo ""
    exit 1
fi
