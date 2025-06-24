#!/bin/bash
# Script to clean up repository for Render deployment

# Remove test directories
echo "Removing tests directory..."
rm -rf tests/

# Remove scripts directory (if it exists)
if [ -d "scripts" ]; then
  echo "Removing scripts directory..."
  rm -rf scripts/
fi

# Remove documentation
echo "Removing docs directory..."
rm -rf docs/

# Remove GitHub workflows
echo "Removing .github directory..."
rm -rf .github/

# Remove VSCode configs (if they exist)
if [ -d ".vscode" ]; then
  echo "Removing .vscode directory..."
  rm -rf .vscode/
fi

# Remove development config files
echo "Removing development config files..."
rm -f .flake8 mypy.ini .envrc Makefile

# Remove other development files
echo "Removing other development files..."
rm -f .bumpversion.cfg .coveragerc .darglint .editorconfig .eslintrc.json
rm -f .htmlhintrc .markdownlint.json .pre-commit-config.yaml .pycodestyle .pylintrc
rm -f .pyspelling.yml .ruff.toml .spellcheck-en.txt .stylelintrc.json .travis.yml
rm -f .whitesource .yamllint tox.ini test_readme.py

echo "Cleanup complete!"