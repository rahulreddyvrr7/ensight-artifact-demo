#!/bin/bash
set -e
echo "🔧 Building dependency packages..."
mkdir -p output
echo "v1 - dependency1" > output/dep1.txt
echo "v1 - dependency2" > output/dep2.txt
ls -lh output
