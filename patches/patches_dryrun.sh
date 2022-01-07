#!/usr/bin/env bash

# Dry run each patch file.
for p in *.patch; do
    printf "\nDry run ${p}\n"

    # Run dry run patching from the project root directory.
    cd .. 
    patch -p1 --dry-run < patches/${p}
    cd patches
done
