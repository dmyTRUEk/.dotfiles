#!/bin/sh

apps="""
anst
ff
fm
imagej
net.sourceforge.scidavis
obs
pm
pych
sm
systemsettings5
tg
"""

apps=${apps:1:${#apps}-2}

echo "$apps" | sort -u

