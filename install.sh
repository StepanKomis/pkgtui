#!/usr/bin/env bash
set -e

DEST="$HOME/.local/bin/pkgtui"
SRC="$(cd "$(dirname "$0")" && pwd)/pkgtui"

if [[ ! -f "$SRC" ]]; then
    echo "[pkgtui] Error: script not found at $SRC" >&2
    exit 1
fi

# Check required tools
for cmd in python3 fzf yay pacman; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "[pkgtui] Warning: '$cmd' not found — pkgtui requires it at runtime."
    fi
done

mkdir -p "$(dirname "$DEST")"
cp "$SRC" "$DEST"
chmod +x "$DEST"

echo ""
echo "  ✓ pkgtui installed to $DEST"
echo ""
echo "  Make sure ~/.local/bin is in your PATH, then run:  pkgtui"
echo ""
