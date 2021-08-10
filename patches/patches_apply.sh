#!/usr/bin/env bash

# Apply each patch file.
for p in *.patch; do
    printf "\nApply ${p}\n"

    # Apply patch from the project root directory.
    cd .. 
    patch -p1 < patches/${p}
    cd patches
done
