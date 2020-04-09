#!/usr/bin/env bash
rm -rf src pkg st-*
makepkg -si --noconfirm
rm -rf src pkg st-*
