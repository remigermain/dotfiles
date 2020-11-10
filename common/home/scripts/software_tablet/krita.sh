
## krita
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
xsetwacom --set "$tabletpad" Button 3 key "b" # brush
xsetwacom --set "$tabletpad" Button 8 key "e" # eraser

xsetwacom --set "$tabletpad" Button 9 key "ctrl alt o"  # opacity less
xsetwacom --set "$tabletpad" Button 10 key "o" # opacity more
xsetwacom --set "$tabletpad" Button 11 key "[" # brush size less
xsetwacom --set "$tabletpad" Button 12 key "]" # brush size more

xsetwacom --set "$tabletpad" Button 13 key "m" # selection
xsetwacom --set "$tabletpad" Button 14 key "i" # color selector
xsetwacom --set "$tabletpad" Button 15 key "alt [" # next layer
xsetwacom --set "$tabletpad" Button 16 key "alt ]" # prev layer