import XCTest
import TwentyTwentyThree
import Common

class TestsDay7: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day6_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day6Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day7_part1Example() throws {
        XCTAssertEqual(try Day7.getAnswerPart1(input: example), 288)
    }
    
    func test_day7_part1() {
        XCTAssertEqual(try Day7.getAnswerPart1(input: input), 2756160)
    }
    
    func test_day7_part2Example() {
        XCTAssertEqual(try Day7.getAnswerPart2(input: example), 71503)
    }
    
    func test_day7_part2() {
        XCTAssertEqual(try Day7.getAnswerPart2(input: input), 34788142)
    }
}

