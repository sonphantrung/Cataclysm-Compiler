#!/bin/bash
# download the latest artifact in this repo & set it up for playing
repo="casswedson/Cataclysm-Compiler"
cd "$HOME/Desktop/Cataclysm-DDA"

rm -frv temp/
mkdir -v temp/

artifact=$(gh api /repos/"$repo"/actions/artifacts --jq '.artifacts[].workflow_run.id' | head -n 1)

gh run download "$artifact" -D temp/ -R "$repo"

unzip temp/cataclysm-tiles/cataclysm-tiles.zip -d temp/cataclysm-tiles/

mv -fv temp/cataclysm-tiles/* .

rm -fvr temp/
