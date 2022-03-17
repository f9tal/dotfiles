#!/bin/sh
set -e

echo "🐀 $( mullvad status | cut -d ' ' -f3 )"
