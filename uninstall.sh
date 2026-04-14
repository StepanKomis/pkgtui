#!/usr/bin/env bash
set -e

DEST="$HOME/.local/bin/pkgtui"

if [[ -f "$DEST" ]]; then
    rm "$DEST"
    echo "  ✓ pkgtui removed from $DEST"
else
    echo "  pkgtui is not installed at $DEST"
fi
