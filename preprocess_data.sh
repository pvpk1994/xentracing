#this preprocess targets at domain 2,3's vcpu 0, going to make this a user-defined value later
FILE_NAME=new_xentrace_aaf.txt
RAW_FILE_NAME=raw_xentrace_aaf.txt
TMP=temp_file.txt
grep -E "[2-3]v0" ${RAW_FILE_NAME} > ${FILE_NAME}
uniq ${FILE_NAME} > ${TMP}
awk '{a[NR]=$1;b[NR]=$2} END{for(i=1;i<NR;i++) print a[i],b[i],b[i+1]}' ${TMP} > ${FILE_NAME}
rm ${TMP}
#To draw the gantt graph requires the installation of python and the matplotlib and numpy for that corresppponding version
python3 draw_gantt_graph.py ${FILE_NAME}
