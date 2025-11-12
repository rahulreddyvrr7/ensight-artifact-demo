#!/bin/bash
echo "Building main code using dependencies..."
mkdir -p output/package
cat output/dependencies/dependency.txt > output/package/main_build.txt
echo "Main package build completed on $(date)" >> output/package/main_build.txt
