#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist/web

echo 'Building for web ...'
godot --export "HTML5" dist/web/index.html

echo 'Building for linux ...'
godot --export "Linux/X11" dist/super-repair-bros.x86_64

echo 'Building for Windows ...'
godot --export "Windows Desktop" dist/super-repair-bros.exe

