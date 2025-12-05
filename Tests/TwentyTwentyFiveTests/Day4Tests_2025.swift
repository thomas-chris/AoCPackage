//
//  Day4Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 4, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay4 {
    let input = Input.array(seperator: "\n", file: "Day4_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day4Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day4_part1Example() {
        #expect(Day4.getAnswerPart1(input: example) == 13)
    }
    
    @Test func test_day4_part1() {
        #expect(Day4.getAnswerPart1(input: input) == 1351)
    }
    
    @Test func test_day4_part2_Example() {
        #expect(Day4.getAnswerPart2(input: example) == 43)
    }
    
    @Test func test_day4_part2() {
        #expect(Day4.getAnswerPart2(input: input) == 8345)
    }
    
}

class Day4Tests: XCTestCase {
    let input = Input.array(seperator: "\n", file: "Day4_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day4Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })

    func test_part1() throws {
        measure {
            XCTAssertTrue(Day4.getAnswerPart1(input: input) == 1351)
        }
    }

    func test_part2() throws {
        measure {
            XCTAssertTrue(Day4.getAnswerPart2(input: input) == 8345)
        }
    }
}
