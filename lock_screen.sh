#!/bin/bash

brightness=$(light)
revert() {
    rm /tmp/*screen*.png
    light -S $brightness
}

trap revert HUP INT TERM
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png

img0="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_middlefingerhello.png"
img1="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_middlefingerportal.png"
img2="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_eyepull.png"
img3="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_portal.png"
img4="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_headscratch.png"
img5="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_angrymorty.png"
img6="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_picklerick.png"
img7="/home/afonso_sr/.i3/i3lock_imgs/rick_and_morty_mrpoopybuthole.png"

codes=("img0" "img1" "img2" "img3" "img4" "img5" "img6" "img7")

rand=$[$RANDOM % ${#codes[@]}]

chosen_img=${codes[$rand]}

convert -composite /tmp/screen_blur.png ${!chosen_img} -gravity South -geometry -20x1200 /tmp/screen.png

SCRIPT_PATH="/home/afonso_sr/.i3/lock_dimlight.sh"
("$SCRIPT_PATH") &

i3lock -n -u -i /tmp/screen.png
revert
