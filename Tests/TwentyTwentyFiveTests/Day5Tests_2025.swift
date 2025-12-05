//
//  Day5Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 5, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay5 {
    let input = Input.getInputString(name: "Day5_2025", bundle: .twentyTwentyFive)
    let example = Input.getInputString(name: "Day5Example_2025", bundle: .twentyTwentyFive)

    @Test func day5_part1Example() {
        #expect(Day5.getAnswerPart1(input: example) == 3)
    }
    
    @Test func test_day5_part1() {
        #expect(Day5.getAnswerPart1(input: input) == 739)
    }
    
    @Test func test_day5_part2_Example() {
        #expect(Day5.getAnswerPart2(input: example) == 14)
    }
    
    @Test func test_day5_part2() {
        #expect(Day5.getAnswerPart2(input: input) == 344486348901788)
    }
    
}

class Day5Tests: XCTestCase {
    let input = Input.getInputString(name: "Day5_2025", bundle: .twentyTwentyFive)
    let example = Input.getInputString(name: "Day5Example_2025", bundle: .twentyTwentyFive)


    func test_part1() throws {
        measure {
            XCTAssertTrue(Day5.getAnswerPart1(input: input) == 739)
        }
    }

    func test_part2() throws {
        measure {
            XCTAssertTrue(Day5.getAnswerPart2(input: input) == 344486348901788)
        }
    }
}
