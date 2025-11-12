#!/bin/bash
set -e
echo "🔧 Building dependency packages..."
mkdir -p output
echo "v2 - dependency1" > output/dep1.txt
echo "v2 - dependency2" > output/dep2.txt
ls -lh output
