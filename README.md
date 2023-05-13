# avi2mov
conversion from raw avi movie to prores

the file is a shell script with two input parameters:

source directory and destination directory.

The script will look for all files ending in .avi in the source folder. One by one it will convert each file using ffmpeg to convert the file to prores. Uncomment the appropriate line for enabling or disabling interlaced or progressive sources.

