#!/usr/bin/env bash
# build.sh
#

PROJECT_BINARY_NAME=foo-bin
GO_MAIN_DIR=./cmd/foo-bin/
OUTPUT_DIR=./_output

VERSION_PACKAGE=github.com/go-project-pkg/version
VERSION=$(git describe --tags --always --match='v*')
GIT_COMMIT=$(git rev-parse HEAD)
GIT_TREE_STATE=dirty

if git status --porcelain 2>/dev/null; then
    GIT_TREE_STATE=clean
fi

LDFLAGS="-X $VERSION_PACKAGE.GitVersion=$VERSION
        -X $VERSION_PACKAGE.GitCommit=$GIT_COMMIT
        -X $VERSION_PACKAGE.GitTreeState=$GIT_TREE_STATE
        -X $VERSION_PACKAGE.BuildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

go build -tags=jsoniter -ldflags "$LDFLAGS" \
    -o $OUTPUT_DIR/$PROJECT_BINARY_NAME $GO_MAIN_DIR

exit 0
