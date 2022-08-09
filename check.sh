#!/bin/bash

Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
White=$'\e[1;36m'

# Shows help
function show_help(){
    echo "Usage: check.sh <path> [<options>]"
    echo "  <options>  "
    echo "      --run  <path>       Runs the static code analysis on the given path and store the result"
    echo "      --show <issue-name> Show the issue with the given name"
    echo "      --count             Count the number of issues"
    echo "      --list              Show a list of available issue names"
    echo -e "Examples:"
    echo "./check.sh --count"
    echo "./check.sh --show PhanCommentDuplicateParam"
    echo "./check.sh --run /var/www/html/your-php-project"
    exit 0
}

# Corre el analisis de codigo estatico y lo almacena en phan.log
function run_analysis(){
    phan -l $1 > phan.log
}

# Lee todas las posibles issues y crea una lista
function count_issues(){

    read file issues and do while with each line
    while read -r line; do
        total=$(cat phan.log | grep -E "$line" | wc -l)
        if [ $total -gt 0 ]; then
            echo -e "$line: $total"
        fi
    done < issues

}

# Imprime todas las issues encontradas de un topico
function show_issue(){
    echo -e "\n"
    echo "$Red $1 [ Count: $(cat phan.log | grep -E "$1" | awk -F ' ' '{print $1}' | wc -l) ]"
    echo "================================================================================"
    echo "$White"
    cat phan.log | grep -E "$1" | awk -F ' ' '{print $1}'
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
   show_help
fi

if [ "$1" == "--run" ]; then
    run_analysis $2
fi

if [ "$1" == "--show" ]; then
    show_issue $2
    exit 0
fi

if [ "$1" == "--count" ]; then
    count_issues
    exit 0
fi

if [ "$1" == "--list" ]; then
    cat issues | less
    exit 0
fi