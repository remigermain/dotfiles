#!/bin/bash
cd $(dirname $0)


# Setup HUION WH1409, after bridged to wacom driver with Digimend Kernel module.
# License: CC-0/Public-Domain license
# author: deevad

# Tablet definition
#tabletstylus="TABLET Pen Tablet Pen stylus"
#tabletpad="TABLET Pen Tablet Pad pad"

# my settings
tabletstylus="HID 256c:006e Pen stylus"
tabletpad="HID 256c:006e Pad pad"
tabletpadmous="HID 256c:006e Pad pad"
# Reset
xsetwacom --set "$tabletstylus" ResetArea
xsetwacom --set "$tabletstylus" RawSample 4

# Mapping
# get maximum size geometry with:
# xsetwacom --get "$tabletstylus" Area
# 0 0 55200 34500

tabletX=55200
tabletY=34500
# screen size:
dim="$(xdpyinfo | grep dimension |  sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' | sed 's/x/\n/g' | wc -l)"
screenX=1920
screenY=1080
if [[ $dim == 2 ]]; then
	dim="$(xdpyinfo | grep dimension |  sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' | sed 's/x/\n/g' | bc)"
	dim=(${dim//\n })
	screenX=${dim[0]}
	screenY=${dim[1]}
fi

# map to good screen (dual nvidia)


## prob
xsetwacom --set "$tabletstylus" MapToOutput HEAD-0

# setup ratio :
newtabletY=$(( $screenY * $tabletX / $screenX ))
xsetwacom --set "$tabletstylus" Area 0 0 "$tabletX" "$newtabletY"

# Buttons
# =======

soft="krita"
if [ $# -ge 1 ]; then
	soft="$1"
fi

if [ $soft == 'mypaint' ]; then
	software_tablet/mypaint.sh "$tabletstylus" "$tabletpad"
elif [ $soft == 'inkscape' ]; then
	software_tablet/inkscape.sh "$tabletstylus" "$tabletpad"
elif [ $soft == 'krita' ]; then
	software_tablet/krita.sh "$tabletstylus" "$tabletpad"
else
	echo "error"
fi

printf "${soft^} Key Mapping [$screenX X $screenY][ OK ]\n"


# Xinput option
# =============
# for the list:
# xinput --list

# xinput list-props 'TABLET Pen Tablet Mouse'


#prob 
#xinput set-prop "$tabletpenmouse" "Evdev Middle Button Emulation" 0
# alternate way to map to a single screen
# execute "xrander" in a terminal to get the screen name ( DVI-D-0 in this example )
# xinput set-prop 'TABLET Pen Tablet Pen stylus' DVI-D-0
