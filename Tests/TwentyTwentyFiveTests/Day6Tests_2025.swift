//
//  Day6Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 6, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay6 {
    let input = Input.array(seperator: "\n", file: "Day6_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day6Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day6_part1Example() {
        #expect(Day6.getAnswerPart1(input: example) == 4277556)
    }
    
    @Test func test_day6_part1() {
        #expect(Day6.getAnswerPart1(input: input) == 4449991244405)
    }
    
    @Test func test_day6_part2_Example() {
        #expect(Day6.getAnswerPart2(input: example) == 3263827)
    }
    
    @Test func test_day6_part2() {
        #expect(Day6.getAnswerPart2(input: input) == 9348430857627)
    }
    
}
