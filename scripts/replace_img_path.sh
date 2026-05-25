#!/bin/bash
# replace_pics.sh

YEAR="${1}"
CATEGORY="${2}"
FILE="${3}"

if [[ -z "$YEAR" || -z "$CATEGORY" || -z "$FILE" ]]; then
  echo "Usage: $0 <year> <category> <file.md>"
  exit 1
fi

sed -i '' "s|!\[\[\([^]]*\)\]\]|![]( ../../assets/${YEAR}/${CATEGORY}/\1)|g" "$FILE"

echo "Done! Replaced in $FILE"