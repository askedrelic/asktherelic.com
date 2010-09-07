#!/bin/bash
# Builds blogofile, then copies over newer files
# To be run from ~/public_html/asktherelic.com/private

blogofile -v build
cp -vrf _site/* ../public/
