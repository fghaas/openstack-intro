#!/bin/bash

pandoc -f gfm -t epub \
       -o notes.epub \
       --metadata-file notes-metadata.yaml \
       markdown/what.md \
       markdown/how.md \
       markdown/why.md \
       markdown/conclusion.md \
