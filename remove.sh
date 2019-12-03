#!/bin/bash

XCODE_USER_TEMPLATES_DIR=$HOME/Library/Developer/Xcode/Templates/File\ Templates
CS_TEMPLATES_DIR=Clean\ Swift
MVC_TEMPLATES_DIR=MVC

echo "Remove Clean Swift"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$CS_TEMPLATES_DIR"

echo "Remove MVC"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$MVC_TEMPLATES_DIR"