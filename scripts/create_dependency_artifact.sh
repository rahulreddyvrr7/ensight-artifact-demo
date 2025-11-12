#!/bin/bash
set -e

echo "🔧 Building dependency packages..."

# Create an output directory for artifacts
mkdir -p output

# Simulate dependency builds (replace these with real build steps)
echo "Sample dependency content v1" > output/dependency1.txt
echo "Another dependency content v1" > output/dependency2.txt

echo "✅ Dependency packages created:"
ls -lh output/
