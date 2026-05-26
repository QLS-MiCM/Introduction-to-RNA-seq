#!/usr/bin/env bash
# Run this once before the workshop.
#   bash setup.sh

set -u

case "$(uname -s)" in
    Darwin*) OS=mac ;;
    Linux*)  grep -qi microsoft /proc/version 2>/dev/null && OS=wsl || OS=linux ;;
    *) echo "unrecognized OS: $(uname -s). on Windows, open WSL Ubuntu first." >&2; exit 1 ;;
esac
echo "detected: $OS"

if [ "$OS" = "mac" ]; then
    if ! command -v brew >/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update || true
    for p in wget sratoolkit; do
        brew list --formula | grep -qx "$p" || brew install "$p"
    done
else
    sudo apt-get update -y
    sudo apt-get install -y curl wget gzip tar grep gawk sed sra-toolkit
fi

mkdir -p ~/workshop/data

echo
echo "checking PATH..."
miss=0
for t in wget gzip tar awk grep sort uniq cut head tail wc sed curl; do
    if command -v "$t" >/dev/null; then
        echo "ok   $t"
    else
        echo "MISS $t"
        miss=$((miss+1))
    fi
done

if command -v fastq-dump >/dev/null; then
    echo "ok   fastq-dump"
else
    echo "MISS fastq-dump"
    miss=$((miss+1))
fi

echo
[ $miss -eq 0 ] && echo "ready." || { echo "$miss missing -- flag it at the session start."; exit 1; }
