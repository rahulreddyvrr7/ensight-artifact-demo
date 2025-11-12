#!/bin/bash
set -e
echo "🏗️ Building project using dependencies..."
mkdir -p build
cat dependencies/* > build/final_output.txt
echo "✅ Build completed."
ls -lh build/
