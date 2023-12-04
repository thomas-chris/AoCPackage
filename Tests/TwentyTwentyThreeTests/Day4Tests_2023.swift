import XCTest
import TwentyTwentyThree
import Common

class TestsDay4: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day4_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day4Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day3_part1Example() throws {
        XCTAssertEqual(try Day4.getAnswerPart1(input: example), 13)
    }
    
    func test_day3_part1() {
        XCTAssertEqual(try Day4.getAnswerPart1(input: input), 18519)
    }
    
    func test_day3_part2Example() {
        XCTAssertEqual(try Day4.getAnswerPart2(input: example), 30)
    }
    
    func test_day3_part2() {
        XCTAssertEqual(try Day4.getAnswerPart2(input: input), 87449461)
    }
}

