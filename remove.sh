#!/bin/bash

XCODE_USER_TEMPLATES_DIR=$HOME/Library/Developer/Xcode/Templates/File\ Templates
MVC_TEMPLATES_DIR=MVC
DS_TEMPLATES_DIR=DataSource

echo "Remove MVC templates"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$MVC_TEMPLATES_DIR"

echo "Remove DataSource templates"
rm -fR "$XCODE_USER_TEMPLATES_DIR/$DS_TEMPLATES_DIR"