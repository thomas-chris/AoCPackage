import XCTest
import TwentyTwentyThree
import Common

class TestsDay2: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day2_2023", bundle: .twentyTwentyThree, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day2Example_2023", bundle: .twentyTwentyThree, compactmap: { $0 })
    
    func test_day2_part1Example() throws {
        XCTAssertEqual(try Day2.getAnswerPart1(input: example), 8)
    }
    
    func test_day2_part1() {
        XCTAssertEqual(try Day2.getAnswerPart1(input: input), 2076)
    }
    
    func test_day2_part2Example() {
        XCTAssertEqual(try Day2.getAnswerPart2(input: example), 2286)
    }
    
    func test_day2_part2() {
        XCTAssertEqual(try Day2.getAnswerPart2(input: input), 70950)
    }
}

