#!/bin/bash

while getopts 'c:' OPTION; do


  case "$OPTION" in
    c)
      class="$OPTARG"
      echo "IP class $OPTARG selected"
      ;;
    ?)
      echo "script usage: $(basename \$0) [-c <A/B/C>]" >&2
      echo
      echo "++++++++++++++++++++++++++++++++++++++" >&2
      echo "CLASS A 10.0.0.0 - 10.255.255.255" >&2
      echo "CLASS B 172.16.0.0 - 172.31.255.255" >&2
      echo "CLASS C 192.168.0.0 - 192.168.255.255" >&2
      echo "++++++++++++++++++++++++++++++++++++++" >&2
      echo
      echo "Eg. ./privateIPscanner.sh -c A  --> FOR CLASS A SCAN" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"


if [ $class == "A" ];
    then 
        host=("10")

        for i in $(seq 0 254); do
            for j in  $(seq 0 254); do
                for k in  $(seq 1 254); do
                    echo -ne "$host.$i.$j.$k\033[0K\r"
                    timeout 1 bash -c "ping -c 1 $host.$i.$j.$k" &> /dev/null && echo -e "\033[0K\t[+] Host $host.$i.$j.$k - ACTIVE" &
                done; wait
            done;
        done;
fi


if [ $class == "B" ];
    then 
        host=("172")

        for i in $(seq 16 31); do
            for j in  $(seq 0 254); do
                for k in  $(seq 1 254); do
                    echo -ne "$host.$i.$j.$k\033[0K\r"
                    timeout 1 bash -c "ping -c 1 $host.$i.$j.$k" &> /dev/null && echo -e "\033[0K\t[+] Host $host.$i.$j.$k - ACTIVE" &
                done; wait
            done;
        done;
fi



if [ $class == "C" ];
    then 
        host=("192")

        for i in $(seq 168 168); do
            for j in  $(seq 0 254); do
                for k in  $(seq 1 254); do
                    echo -ne "$host.$i.$j.$k\033[0K\r"
                    timeout 1 bash -c "ping -c 1 $host.$i.$j.$k" &> /dev/null && echo -e "\033[0K\t[+] Host $host.$i.$j.$k - ACTIVE" &
                done; wait
            done;
        done;
fi
