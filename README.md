# kymographs
Automated kymographs from MOV files

1) Download 'script.sh' and make it executable by command

chmod +x extract.sh

2) Place your MOV movie files in selected directory

3) If you are working on computer cluster start a job by (-I is with uppercase i)

qsub -I 

4) On computer cluster, software module must be loaded 

module load ffmpeg

5) run script 'extract.sh' with MOV directory parameter, e.g.

if script is in the actual directory

./extract.sh /home/me/Movies

or if the srcipt is anywhere

/home/me/scripts/extract.sh /home/me/Movies

This script generates a set of directories with individual frames from movies. These shots are taken from several 2-second time points spaced at randomly selected intervals between 2 and 30 seconds. 

Directories are named <movie_name>-<time_poin>
