//
//  Day9Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 9, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay9 {
    let input = Input.getInputString(name: "Day9_2024", bundle: .twentyTwentyFour)
    let example = Input.getInputString(name: "Day9Example_2024", bundle: .twentyTwentyFour)
    
    @Test func day9_part1Example() {
        #expect(Day9.getAnswerPart1(input: example) == 1928)
    }
    
    @Test func test_day9_part1() {
        #expect(Day9.getAnswerPart1(input: input) == 6200294120911)
    }
    
    @Test func test_day9_part2_Example() {
        #expect(Day9.getAnswerPart2(input: example) == 2858)
    }
    
    @Test func test_day9_part2() {
        #expect(Day9.getAnswerPart2(input: input) == 6227018762750)
    }
    
}
