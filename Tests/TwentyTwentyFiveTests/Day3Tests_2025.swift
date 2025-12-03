//
//  Day3Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 3, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay3 {
    let input = Input.array(seperator: "\n", file: "Day3_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let pj = Input.array(seperator: "\n", file: "Day3_PJ_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day3Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day3_part1Example() {
        #expect(Day3.getAnswerPart1(input: example) == 357)
    }
    
    @Test func test_day3_part1() {
        #expect(Day3.getAnswerPart1(input: input) == 17316)
    }
    
    @Test func test_day3_part2_Example() {
        #expect(Day3.getAnswerPart2(input: example) == 3121910778619)
    }
    
    @Test func test_day3_part2() {
        #expect(Day3.getAnswerPart2(input: input) == 171741365473332)
    }

    @Test func test_day3_pj() {
        #expect(Day3.getAnswerPart2(input: pj) == 169077317650774)
    }

}

class Day3Tests: XCTestCase {
    let input = Input.array(seperator: "\n", file: "Day3_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day3Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })

    func test_part1() throws {
        measure {
            XCTAssertTrue(Day3.getAnswerPart1(input: input) == 17316)
        }
    }

    func test_part2() throws {
        measure {
            XCTAssertTrue(Day3.getAnswerPart2(input: input) == 171741365473332)
        }
    }
}
