#!/bin/bash

XCODE_USER_TEMPLATES_DIR=$HOME/Library/Developer/Xcode/Templates/File\ Templates
CS_TEMPLATES_DIR=Clean\ Swift
MVC_TEMPLATES_DIR=MVC
DS_TEMPLATES_DIR=DataSource

echo "Remove Clean Swift templates"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$CS_TEMPLATES_DIR"

echo "Remove MVC templates"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$MVC_TEMPLATES_DIR"

echo "Remove DataSource templates"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$DS_TEMPLATES_DIR"