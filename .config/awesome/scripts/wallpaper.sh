#!/bin/sh
#!/usr/bin/env bash
#!/usr/bin/python
#!/bin/env bash

NITCONF='$HOME/.config/nitrogen/bg-saved.cfg'
IMG="cat $NITCONF | grep "file" | cut -d'=' -f2 | tail -1"
NITIMG=$(eval "$IMG")

wal -i $NITIMG

./generate-colors.sh
