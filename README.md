# Linguist Glass gRPC Module

This repository contains the gRPC protocol buffer definitions and generated code for the Linguist Glass language learning application.

## Structure

```
langgrpc/
├── proto/           # .proto source files
├── go/              # Generated Go code
└── ts/              # Generated TypeScript code
```

## Installation

### Go (Backend)

```bash
go get github.com/mabramyan/langgrpc
```

### TypeScript (Frontend)

```bash
# Using npm
npm install @mabramyan/langgrpc

# Or clone and build manually
git clone git@github.com:mabramyan/langgrpc.git
cd langgrpc/ts
npm install && npm run build
```

## Services

| Service | Description |
|---------|-------------|
| `AuthService` | User registration, login, token refresh, profile management |
| `DictionaryService` | Word search, definitions, examples, collections |
| `StudyService` | Flashcards, spaced repetition, progress tracking |
| `VideoService` | YouTube video search, shadowing practice |

## Generating Code

### Go

```bash
protoc --go_out=./go --go_opt=paths=source_relative \
       --go-grpc_out=./go --go-grpc_opt=paths=source_relative \
       proto/*.proto
```

### TypeScript

```bash
protoc --ts_out=./ts --ts_opt=paths=source_relative \
       proto/*.proto
```

## Versioning

This module follows semantic versioning. Major versions may contain breaking changes to the gRPC API.

## License

Proprietary - All rights reserved.
