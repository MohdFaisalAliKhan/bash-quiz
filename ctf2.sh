#!/bin/bash

# Function to display a countdown timer
countdown() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        echo -n "$seconds "
        sleep 1
        seconds=$((seconds - 1))
    done
    echo "Time's up!"
}

# Questions and MCQ Answer Choices
questions=("What is the primary purpose of the 'ls' command in Linux?"
           "How do you create a new directory in the terminal?"
           "What is a shell script and what is its file extension?"
           "How do you list all running processes in Linux?"
           "What does the 'chmod' command do?"
           "How do you redirect the output of a command to a file in Bash?"
           "What is the 'grep' command used for?"
           "What is the home directory of the root user?"
           "How do you terminate a running process in the terminal?"
           "What is the purpose of the 'if' statement in Bash?")

answer_choices=("a) List files and directories"
                "b) Change file permissions"
                "c) Create a new user"
                "d) Remove a file"
                "a) mkdir"
                "b) touch"
                "c) mv"
                "d) rm"
                "a) A text file with .txt extension"
                "b) A binary file with .bin extension"
                "c) A shell script is a file containing a series of commands. Its file extension is '.sh'."
                "d) A configuration file for the terminal"
                "a) ls -a"
                "b) ps aux"
                "c) top"
                "d) df -h"
                "a) Change file permissions"
                "b) Change the owner of a file"
                "c) List the contents of a directory"
                "d) Change the group of a file"
                "a) command > file.txt"
                "b) command >> file.txt"
                "c) command < file.txt"
                "d) command | grep pattern"
                "a) Search text using patterns"
                "b) List the contents of a directory"
                "c) Print the working directory"
                "d) Create a new user"
                "a) /home"
                "b) /"
                "c) /root"
                "d) /var"
                "a) Ctrl+Z"
                "b) Ctrl+Z"
                "c) Ctrl+C"
                "d) Ctrl+X"
                "a) Variable assignment"
                "b) Looping"
                "c) Function definition"
                "d) Conditional execution ")

correct_answers=("a" "a" "c" "b" "a" "a" "a" "c" "c" "d")

# Create a file to store responses
response_file=".linux_quiz_responses.txt"
> "$response_file" # Clear the file if it already exists

# Set the countdown time to 30 seconds
countdown_time=20

# Loop through the questions and check answers
score=0
for ((i=0; i<${#questions[@]}; i++)); do
    echo "Question $((i+1)): ${questions[i]}"
    for ((j=i*4; j<(i+1)*4; j++)); do
        echo "${answer_choices[j]}"
    done
    echo "You have $countdown_time seconds to answer."

    read -t $countdown_time -p "Your answer (a/b/c/d): " user_answer
    if [ -n "$user_answer" ]; then
        echo "Your answer: $user_answer" >> "$response_file"
        if [ "$user_answer" == "${correct_answers[i]}" ]; then
            echo "Correct!"
            score=$((score + 1))
        else
            echo "Wrong! The correct answer is: ${correct_answers[i]}"
        fi
    else
        echo "Time's up! You didn't answer this question."
        echo "Your answer: (Not answered)" >> "$response_file"
    fi
done

echo "You answered $score out of ${#questions[@]} questions correctly."
echo "Your responses have been saved in '$response_file'."
