
## inkscape
# ---------
# | 1 | 2 |
# |---|---|
# | 3 | 8 |
# |=======|
# | 9 |10 |
# |---|---|
# |11 |12 |
# |=======|
# |13 | ? |
# |---|---|
# | ? | ? |
# |=======|
tabletstylus="$1"
tabletpad="$2"

xsetwacom --set "$tabletstylus" Button 2 2
xsetwacom --set "$tabletstylus" Button 3 3

xsetwacom --set "$tabletpad" Button 1 key "minus" # zoom out
xsetwacom --set "$tabletpad" Button 2 key "plus" # zoom out
xsetwacom --set "$tabletpad" Button 3 key "s" # brush
xsetwacom --set "$tabletpad" Button 8 key "shift ctrl f" # eraser

xsetwacom --set "$tabletpad" Button 9 key "ctrl alt o"  # settings
xsetwacom --set "$tabletpad" Button 10 key "del" # delete
xsetwacom --set "$tabletpad" Button 11 key "b" # line
xsetwacom --set "$tabletpad" Button 12 key "ctrl d" #  duplic

xsetwacom --set "$tabletpad" Button 13 key "r" # cube
xsetwacom --set "$tabletpad" Button 14 key "e" # circle
#xsetwacom --set "$tabletpad" Button 15 key "alt [" # next layer
xsetwacom --set "$tabletpad" Button 16 key "esc" # prev layer
