#! /bin/bash

# enter your username here, make sure you have valid SSH-Keys present on the server
USERNAME="<your username here>"



OPTIND=1   # Reset in case getopts has been used previously in the shell.

show_help(){
    echo "helper script for using pool printers at TF Uni Freiburg"
    echo "(c) 2019 - Andreas Philipp "
    echo " "

    echo "Usage:"
    echo "-h: show this help"
    echo "-f <path to file>: select the file to print"
    echo "-p: select the printer on which you want to print"
    echo "-q: show queue of printer"
}

show_queue(){
    echo "Queue for printer $printer is:"
    queue=$(ssh -T $USERNAME@login.informatik.uni-freiburg.de lpq -P $printer)
    echo $queue
}

# Main program

while getopts "h?f:p:q" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    f)  file=$OPTARG
        ;;
    p)  printer=$OPTARG
        ;;
    q)  only_queue=1
        ;;
    esac
done
if (( $OPTIND == 1 )); then # no options were specified
   show_help
   exit 0
fi

if  (( $only_queue == 1 )); then
    show_queue
    exit 0
fi 

show_queue
echo "--------------------------"

scp $file $USERNAME@login.informatik.uni-freiburg.de:/home/$USERNAME/print
ssh -T $USERNAME@login.informatik.uni-freiburg.de <<EOF
  lpr -P"$printer" "/home/$USERNAME/print/$file"
  rm /home/$USERNAME/print/$file
EOF
