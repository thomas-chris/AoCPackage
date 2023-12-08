import XCTest
import TwentyTwentyThree
import Common

class TestsDay8: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day8_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day8Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example2 = Input.array(seperator: "\n", file: "Day8Part2Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day8_part1Example() throws {
        XCTAssertEqual(try Day8.getAnswerPart1(input: example), 6)
    }
    
    func test_day8_part1() {
        XCTAssertEqual(try Day8.getAnswerPart1(input: input), 13207)
    }
    
    func test_day8_part2Example() {
        XCTAssertEqual(try Day8.getAnswerPart2(input: example2), 6)
    }
    
    // only runs in release mode
    func test_day8_part2() {
        XCTAssertEqual(try Day8.getAnswerPart2(input: input), 12324145107121)
    }
}

