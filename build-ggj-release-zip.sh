#!/bin/bash

rm super-repair-bros-ggj2020.zip

mkdir -p ggj-release/src
cp -r -- * ggj-release/src/
rm -r ggj-release/src/ggj-release

(
	cd ggj-release/ || exit

	mv src/dist/ release

	mkdir press
	cp src/Assets/Graphics/screenshots/screenshot_*.png press/

	zip -r ../super-repair-bros-ggj2020.zip .
)

rm -r ggj-release/
