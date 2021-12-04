# version

Project version management pkg.

## Usage

Go:

```go
import "github.com/go-project-pkg/version"

func main() {
  fmt.Println(version.Get())
}
```

Shell:

```sh
VERSION_PACKAGE=github.com/go-project-pkg/version
VERSION=$(git describe --tags --always --match='v*')
GIT_COMMIT=$(git rev-parse HEAD)
GIT_TREE_STATE=dirty

if git status --porcelain 2>/dev/null;then
    GIT_TREE_STATE=clean
fi

# go build
go build -tags=jsoniter -ldflags \
    -X $VERSION_PACKAGE.GitVersion=$VERSION \
    -X $VERSION_PACKAGE.GitCommit=$GIT_COMMIT \
    -X $VERSION_PACKAGE.GitTreeState=$GIT_TREE_STATE \
    -X $VERSION_PACKAGE.BuildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    -o your-project-binaryname your/project/maingo/path
```
