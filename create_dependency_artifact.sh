#!/bin/bash
echo "Packaging dependencies..."
cd output/dependencies
zip -r ../../dependencies.zip .
kscan
echo "Dependency artifact created: dependencies.zip"
