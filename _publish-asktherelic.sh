#!/bin/bash
# Builds blogofile, then copies over newer files
# To be run from ~/public_html/asktherelic.com/private
#test

blogofile -v build
cp -vrf _site/* ../public/
