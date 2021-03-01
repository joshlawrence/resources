#!/bin/bash
#
# https://thomask.sdf.org/blog/2020/10/29/bash-funroll-loops.html

script_name=$0
target=$(($RANDOM % 100 + 1))
truncate "$script_name" -s 583
echo "Guess the number between 1 and 100:"
GUESS=$(cat << END_GUESS
read guess
if (( guess > target )); then
    echo "echo '\$guess is too high!'" >> "\$script_name"
    echo "\$GUESS" >> "\$script_name"
elif (( guess < target )); then
    echo "echo '\$guess is too low!'" >> "\$script_name"
    echo "\$GUESS" >> "\$script_name"
else
    echo "echo 'You got it! The number was \$target.'" >> "\$script_name"
    echo "exit 0" >> "\$script_name"
fi
END_GUESS
)
echo "$GUESS" >> "$script_name"