#!/bin/sh

apps="""
anst
ds
ff
fm
imagej
net.sourceforge.scidavis
obs
ocenaudio
pm
pych
sm
systemsettings5
tg
"""

apps=${apps:1:${#apps}-2}

echo "$apps" | sort -u

