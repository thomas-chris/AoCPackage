#!/bin/bash

# Function to create folders and files
create_structure() {
    local base_path=$1
    local x=$2
    local y=$3
    local z=$4

    # Define the folder structure and files using variables
    local folder_structure=(
        "Sources/Twenty$x/Inputs/Day$y:Day${y}_20${z}.txt,Day${y}Example_20${z}.txt"
        "Sources/Twenty$x/:Day${y}_20${z}.swift"
        "Tests/Twenty${x}Tests:Day${y}Tests_20${z}.swift"
    )

    for entry in "${folder_structure[@]}"; do
        # Extract folder and file from the entry
        IFS=":" read -r folder files <<< "$entry"
        folder_path="$base_path/$folder"

        # Create the folder if it doesn't exist
        if [ ! -d "$folder_path" ]; then
            echo "Creating folder: $folder_path"
            mkdir -p "$folder_path"
        fi

        # Create files within the folder
        if [ -n "$files" ]; then
            IFS="," read -ra file_list <<< "$files"
            for file in "${file_list[@]}"; do
                file_path="$folder_path/$file"
                if [ ! -f "$file_path" ]; then
                    echo "Creating file: $file_path"
                    touch "$file_path"
                    populate_template "$file" "$file_path" "$x" "$y" "$z"
                else
                    echo "File already exists: $file_path"
                fi
            done
        fi
    done
}

# Function to populate a Swift file with a template
populate_template() {
    local file=$1
    local file_path=$2
    local x=$3
    local y=$4
    local z=$5

    if [[ "$file" == *".swift" ]]; then
        case "$file" in
        "Day${y}_20${z}.swift")
            cat > "$file_path" <<EOF
//
//  Day${y}_20${z}.swift
//  Created for Twenty${x}
//
//  This file contains the solution for Day ${y}, 20${z}.
//

import Algorithms
import Common
import Regex

public struct Day${y} {
    public static func getAnswerPart1(input: [String]) -> Int {
        // Your code for part 1
        return 0
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        // Your code for part 2
        return 0
    }
}
EOF
            ;;
        "Day${y}Tests_20${z}.swift")
            cat > "$file_path" <<EOF
//
//  Day${y}Tests_20${z}.swift
//  Tests for Twenty${x}
//
//  This file contains test cases for Day ${y}, 20${z}.
//

import Testing
import Twenty${x}
import Common
import XCTest

struct TestsDay${y} {
    let input = Input.array(seperator: "\n", file: "Day${y}_20${z}", bundle: .twenty${x}, compactmap: { \$0 })
    let example = Input.array(seperator: "\n", file: "Day${y}Example_20${z}", bundle: .twenty${x}, compactmap: { \$0 })
    
    @Test func day${y}_part1Example() {
        #expect(Day${y}.getAnswerPart1(input: example) == 11)
    }
    
    @Test func test_day${y}_part1() {
        #expect(Day${y}.getAnswerPart1(input: input) == 3569916)
    }
    
    @Test func test_day${y}_part2_Example() {
        #expect(Day${y}.getAnswerPart2(input: example) == 31)
    }
    
    @Test func test_day${y}_part2() {
        #expect(Day${y}.getAnswerPart2(input: input) == 26407426)
    }
    
}
EOF
            ;;
        esac
    fi
}

# Main script logic
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <base_path> <x> <y> <z>"
    echo "Example: $0 . 24 5 24"
    exit 1
fi

base_path=$1
x=$2
y=$3
z=$4

create_structure "$base_path" "$x" "$y" "$z"
