#!/bin/bash

# Generate TypeScript gRPC code from proto files

set -e

PROTO_DIR="./proto"
TS_OUT="./ts"

echo "Generating TypeScript gRPC code..."

# Create output directory
mkdir -p "$TS_OUT"

# Generate TypeScript code (using grpc-tools or protoc-gen-ts)
for proto_file in "$PROTO_DIR"/*.proto; do
    echo "Processing $proto_file..."
    protoc --ts_out="$TS_OUT" --ts_opt=paths=source_relative \
           "$proto_file"
done

echo "TypeScript code generation complete!"
echo "Output directory: $TS_OUT"
