#!/usr/bin/env bash

number="$1"

if [[ ! $number =~ ^[0-9]+$ ]] || [[ $number -ge 100000 ]]; then
    echo 'invalid input' >&2
    exit 1
fi

to_bin() {
    local num=$1
    local result=""
    while (( num > 0 )); do
        result=$(( num % 2 ))$result
        num=$(( num / 2 ))
    done
    echo ${result:-0}
}

to_hex() {
    local num=$1
    local result=""
    local digits=(0 1 2 3 4 5 6 7 8 9 A B C D E F)
    while (( num > 0 )); do
        result=${digits[num % 16]}$result
        num=$(( num / 16 ))
    done
    echo ${result:-0}
}

hex_result=$(to_hex "$number")
bin_result=$(to_bin "$number")

mkdir -p Problem_3
output_file="Problem_3/conversion_result.txt"

echo "Decimal: $number" > "$output_file"
echo "Hexadecimal: $hex_result" >> "$output_file"
echo "Binary: $bin_result" >> "$output_file"

echo "In $output_file"
