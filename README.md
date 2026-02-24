# Linguist Glass gRPC Module

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains the gRPC protocol buffer definitions and generated code for the **Linguist Glass** language learning application.

## Structure

```
langgrpc/
├── proto/           # .proto source files
│   ├── auth.proto
│   ├── dictionary.proto
│   ├── study.proto
│   └── video.proto
├── go/              # Generated Go code (after running generate-go.sh)
└── ts/              # Generated TypeScript code (after running generate-ts.sh)
```

## Services

| Service | Methods |
|---------|---------|
| `AuthService` | Register, Login, RefreshToken, GetProfile |
| `DictionaryService` | SearchWords, GetWordDetail, CreateCollection, ListDictionaries, AddWordToDictionary |
| `StudyService` | GetDailySession, SubmitStudyResult, AddWordToFlashcards, SyncProgress, GetStats |
| `VideoService` | FindSentencesInVideo, SyncShadowingProgress |

## Installation

### Go (Backend)

Add to your `go.mod`:

```go
require github.com/mabramyan/langgrpc v0.1.0

// If developing locally, use replace directive:
replace github.com/mabramyan/langgrpc => ../grpc
```

Import in your Go code:

```go
import (
    pb "github.com/mabramyan/langgrpc/go/linguistglass"
)
```

### TypeScript (Frontend)

The TypeScript types are generated from the same proto files. After running `generate-ts.sh`, import in your React Native code:

```typescript
import type { Word, Card, Profile } from '@mabramyan/langgrpc/ts';
```

## Generating Code

### Prerequisites

Install protoc and plugins:

```bash
# macOS
brew install protobuf grpc-go

# Or use the Go tools
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

### Generate Go Code

```bash
cd grpc
chmod +x generate-go.sh
./generate-go.sh
```

### Generate TypeScript Code

```bash
cd grpc
chmod +x generate-ts.sh
./generate-ts.sh
```

## Versioning

This module follows semantic versioning:

- **v0.1.x**: Initial proto definitions
- **v1.0.0**: Stable API for production

Major versions may contain breaking changes to the gRPC API.

## Development

When making changes to proto files:

1. Edit `.proto` files in `proto/`
2. Run `./generate-go.sh` and `./generate-ts.sh`
3. Commit generated code along with proto changes
4. Tag a new version: `git tag v0.1.1 && git push origin --tags`

## License

Proprietary - All rights reserved.
