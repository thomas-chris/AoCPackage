import XCTest
import TwentyTwentyThree
import Common

class TestsDay9: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day9_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day9Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day9_part1Example() throws {
        XCTAssertEqual(try Day9.getAnswerPart1(input: example), 114)
    }
    
    func test_day9_part1() {
        XCTAssertEqual(try Day9.getAnswerPart1(input: input), 1641934234)
    }
    
    func test_day9_part2_example() {
        XCTAssertEqual(try Day9.getAnswerPart2(input: example), 2)
    }
    
    func test_day9_part2() {
        XCTAssertEqual(try Day9.getAnswerPart2(input: input), 975)
    }
}

