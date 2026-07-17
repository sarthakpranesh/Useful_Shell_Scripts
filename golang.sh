#!/usr/bin/env bash

# Get Go Version supplied by user
GO_VERSION=$1

if [ -z "$GO_VERSION" ]; then
    GO_VERSION="1.26.1"
fi

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$(uname -m)" in
    x86_64) GOARCH=amd64 ;;
    arm64|aarch64) GOARCH=arm64 ;;
    *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac
GO_PKG="go${GO_VERSION}.${OS}-${GOARCH}.tar.gz"

echo "Downloading Go ${GO_VERSION} for ${OS}-${GOARCH}"
wget "https://golang.org/dl/${GO_PKG}"
sudo tar -C /usr/local -xzf "$GO_PKG"

GO_ENV=(
    '# Go'
    'export GOROOT=/usr/local/go'
    'export PATH=$PATH:$GOROOT/bin'
    "export GOPATH=$HOME/golib"
    'export PATH=$PATH:$GOPATH/bin'
    "export GOPATH=\$GOPATH:$HOME/work/github/go"
)

SHELL_RC=""
if [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
fi

if [ -n "$SHELL_RC" ]; then
    echo "Adding Go config to $SHELL_RC"
    printf '%s\n' "${GO_ENV[@]}" >> "$SHELL_RC"
else
    echo "Config files not found (~/.bashrc, ~/.zshrc). Add the following to your shell config:"
    printf '%s\n' "${GO_ENV[@]}"
fi

# Form here it is my personel preference of workflow

echo "Creating directories"
# golib for local package install and Github/GO for active local development
mkdir -p "$HOME/golib"
mkdir -p "$HOME/work/github/sarthakpranesh/"
mkdir -p "$HOME/work/github/go/bin"
mkdir -p "$HOME/work/github/go/pkg"

rm -f "$GO_PKG"

if [ -n "$SHELL_RC" ]; then
    # shellcheck source=/dev/null
    source "$SHELL_RC"
fi

go version
