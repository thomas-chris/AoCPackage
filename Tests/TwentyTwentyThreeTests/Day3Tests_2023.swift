import XCTest
import TwentyTwentyThree
import Common

class TestsDay3: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day3_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day3Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day3_part1Example() throws {
        XCTAssertEqual(Day3.getAnswerPart1(input: example), 4361)
    }
    
    func test_day3_part1() {
        XCTAssertEqual(Day3.getAnswerPart1(input: input), 546312)
    }
    
    func test_day3_part2Example() {
        XCTAssertEqual(Day3.getAnswerPart2(input: example), 467835)
    }
    
    func test_day3_part2() {
        XCTAssertEqual(Day3.getAnswerPart2(input: input), 87449461)
    }
}

