for f in `ls *.MOV`
do
   echo $f

   fn="${f%.*}"
   mkdir $fn
   fps=`ffprobe -v 0 -of csv=p=0 -select_streams v:0 -show_entries stream=r_frame_rate 1_$f | bc`
   length=`ffprobe -i $f -show_entries format=duration -v quiet -of csv="p=0" | cut -f 1 -d "."`
   sel=0
   while [ "$sel" -lt "$((length-2))" ]
   do
      echo $sel
      name=`printf "%04d" $sel`
      mkdir ${fn}/${name}
      ffmpeg -ss $sel -t 2 -i $f -vf "format=gray, fps=${fps}" $fn/${name}/f%02d.png
      ds=$(( $RANDOM % 30 + 2 )) 
      sel=$((sel+ds))
   done
done



