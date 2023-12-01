import XCTest
import TwentyTwentyThree
import Common

class TestsDay1: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day1_2023", bundle: .twentyTwentyThree, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day1Example_2023", bundle: .twentyTwentyThree, compactmap: { $0 })
    
    func test_day1_part1Example() {
        XCTAssertEqual(Day1.getAnswerPart1(input: example), 142)
    }
    
    func test_day1_part1() {
        XCTAssertEqual(Day1.getAnswerPart1(input: input), 55208)
    }
    
    func test_day1_part2() {
        XCTAssertEqual(Day1.getAnswerPart2(input: input), 54578)
    }
}

