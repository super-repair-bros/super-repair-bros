#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

echo 'Building for web ...'
godot --export 'HTML5' dist/index.html
echo 'done.'

echo 'Building for linux ...'
godot --export 'Linux/X11' dist/super-repair-bros-linux.x86_64
chmod a+x dist/super-repair-bros-linux.x86_64
echo 'done.'

echo 'Building for Windows ...'
godot --export 'Windows Desktop' dist/super-repair-bros-windows.exe
echo 'done.'

echo 'Building for MacOS ...'
godot --export "Mac OSX" dist/super-repair-bros-macos.zip

unzip dist/super-repair-bros-macos.zip Super\ Repair\ Bros.app/Contents/Resources/Super\ Repair\ Bros.pck
zip -d dist/super-repair-bros-macos.zip Super\ Repair\ Bros.app/Contents/Resources/Super\ Repair\ Bros.pck
unzip dist/super-repair-bros-macos.zip Super\ Repair\ Bros.app/Contents/MacOS/Super\ Repair\ Bros
zip -d dist/super-repair-bros-macos.zip Super\ Repair\ Bros.app/Contents/MacOS/Super\ Repair\ Bros

mv Super\ Repair\ Bros.app/Contents/Resources/Super\ Repair\ Bros.pck Super\ Repair\ Bros.app/Contents/MacOS/
chmod a+x Super\ Repair\ Bros.app/Contents/MacOS/Super\ Repair\ Bros

zip -ru dist/super-repair-bros-macos.zip Super\ Repair\ Bros.app/

rm -r Super\ Repair\ Bros.app
echo 'done.'
