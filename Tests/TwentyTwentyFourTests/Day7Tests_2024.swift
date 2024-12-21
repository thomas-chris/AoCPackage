//
//  Day7Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 7, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay7 {
    let input = Input.array(seperator: "\n", file: "Day7_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day7Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day7_part1Example() {
        #expect(Day7.getAnswerPart1(input: example) == 3749)
    }
    
    @Test func test_day7_part1() {
        #expect(Day7.getAnswerPart1(input: input) == 2654749936343)
    }
    
    @Test func test_day7_part2_Example() {
        #expect(Day7.getAnswerPart2(input: example) == 11387)
    }
    
    @Test func test_day7_part2() {
        #expect(Day7.getAnswerPart2(input: input) == 124060392153684)
    }
    
}
