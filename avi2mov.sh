#!/bin/bash

# input source and destination dir

sourcedir=$1
destdir=$2

echo "converting from: $sourcedir to: $destdir"

# loop over all the files

for clip in $sourcedir"/"*.avi; do
    ((count++))
    base=$(basename -s .avi $clip)
    # convert L and R to uppercase for better identification
    base=$(echo $base | tr 'lr' 'LR')
    # output filename
    newname="$base.mov"
    echo "$count   found: "$base" : "$newname "  "
    # using ffmpeg-bar, node based wrapper for ffmpeg to show progress bars.
    # interlaced
    ffmpeg-bar -i $clip -c:v prores -profile:v 3 -flags +ildct+ilme -top 1 -pix_fmt yuv422p10le  -c:a pcm_s16le $destdir"/"$newname
    #ffmpeg-bar -i $clip -pix_fmt yuv422p10le -c:v prores -profile:v 3 -c:a pcm_s16le $destdir"/"$newname
done