#!/bin/bash

show_help() {
    echo "Usage: ./mygrep.sh [OPTIONS] PATTERN FILE"
    echo "Search for PATTERN in FILE (case-insensitive)"
    echo ""
    echo "Options:"
    echo "  -n    Show line numbers for each match"
    echo "  -v    Invert the match (print lines that do not match)"
    echo "  -vn, -nv    Combination of -v and -n options"
    echo "  --help    Display this help message"
    exit 1
}

if [ $# -lt 2 ]; then
    echo "Error: Insufficient arguments"
    echo "Usage: ./mygrep.sh [OPTIONS] PATTERN FILE"
    exit 1
fi

show_line_num=0
invert_match=0
pattern=""
filename=""

while [ $# -gt 0 ]; do
    case "$1" in
        -n)
            show_line_num=1
            shift
            ;;
        -v)
            invert_match=1
            shift
            ;;
        -vn|-nv)
            show_line_num=1
            invert_match=1
            shift
            ;;
        --help)
            show_help
            ;;
        -*)
            echo "Unknown option: $1"
            show_help
            ;;
        *)
            if [ -z "$pattern" ]; then
                pattern="$1"
            elif [ -z "$filename" ]; then
                filename="$1"
            else
                echo "Error: Too many arguments"
                show_help
            fi
            shift
            ;;
    esac
done

if [ -z "$pattern" ] || [ -z "$filename" ]; then
    echo "Error: Missing required arguments"
    show_help
fi

if [ ! -f "$filename" ] || [ ! -r "$filename" ]; then
    echo "Error: Cannot read file '$filename'"
    exit 1
fi

line_num=0
while IFS= read -r line; do
    line_num=$((line_num + 1))
    if echo "$line" | grep -qi "$pattern"; then
        matches=1
    else
        matches=0
    fi
    if ([ $invert_match -eq 0 ] && [ $matches -eq 1 ]) || \
       ([ $invert_match -eq 1 ] && [ $matches -eq 0 ]); then
        if [ $show_line_num -eq 1 ]; then
            echo "$line_num: $line"
        else
            echo "$line"
        fi
    fi
done < "$filename"