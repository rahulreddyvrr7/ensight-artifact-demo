#!/bin/bash
echo "Packaging dependencies..."
cd output/dependencies
zip -r ../../dependencies.zip .
echo "Dependency artifact created: dependencies.zip"
