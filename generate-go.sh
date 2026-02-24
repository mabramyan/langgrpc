#!/bin/bash

# Generate Go gRPC code from proto files

set -e

PROTO_DIR="./proto"
GO_OUT="./go"

echo "Generating Go gRPC code..."

# Create output directory
mkdir -p "$GO_OUT"

# Generate Go code
for proto_file in "$PROTO_DIR"/*.proto; do
    echo "Processing $proto_file..."
    protoc --go_out="$GO_OUT" --go_opt=paths=source_relative \
           --go-grpc_out="$GO_OUT" --go-grpc_opt=paths=source_relative \
           "$proto_file"
done

echo "Go code generation complete!"
echo "Output directory: $GO_OUT"
