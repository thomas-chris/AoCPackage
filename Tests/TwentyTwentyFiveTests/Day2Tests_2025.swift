//
//  Day2Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 2, 2025.
//

import Common
import Foundation
import Testing
import TwentyTwentyFive
import XCTest

struct TestsDay2 {
    let input = Input.getInputString(name: "Day2_2025", bundle: .twentyTwentyFive)
    let example = Input.getInputString(name: "Day2Example_2025", bundle: .twentyTwentyFive)

    @Test func day2_part1Example() {
        #expect(Day2.getAnswerPart1b(input: example) == 1227775554)
    }

    @Test func test_day2_part1() {
        #expect(Day2.getAnswerPart1(input: input) == 38158151648)
    }

    @Test func test_day2_part2_Example() {
        #expect(Day2.getAnswerPart2(input: example) == 4174379265)
    }

    @Test func test_day2_part2() {
        #expect(Day2.getAnswerPart2(input: input) == 45283684555)
    }

}

class PerfTestsDay2: XCTestCase {

    let input = Input.getInputString(name: "Day2_2025", bundle: .twentyTwentyFive)
    func test_performance_part1_forEach() {
        self.measure {
            XCTAssertEqual(Day2.getAnswerPart1(input: input), 38158151648)
        }
    }

    func test_performance_part1_compactMap() {
        self.measure {
            XCTAssertEqual(Day2.getAnswerPart1b(input: input), 38158151648)
        }
    }
}
