#!/bin/bash

# This is a workaround for a bug in Ubuntu's Firefox snap, where it cannot open files in /tmp/
# https://bugs.launchpad.net/snapd/+bug/1972762
#
# The shell alias for invoking neomutt handles deleting the temp files after neomutt exits.

SOURCE_FILE="$1"
TARGET_DIR="$HOME/tmp/neomutt"

mkdir -p "$TARGET_DIR"

cp "$SOURCE_FILE" "$TARGET_DIR"

NEW_FILE_PATH="$TARGET_DIR/$(basename "$SOURCE_FILE")"

firefox "$NEW_FILE_PATH" >/dev/null 2>&1

exit 0
