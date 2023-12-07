import XCTest
import TwentyTwentyThree
import Common

class TestsDay7: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day7_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day7Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day7_part1Example() throws {
        XCTAssertEqual(try Day7.getAnswerPart1(input: example), 6440)
    }
    
    func test_day7_part1() {
        XCTAssertEqual(try Day7.getAnswerPart1(input: input), 253205868)
    }
    
    func test_day7_part2Example() {
        XCTAssertEqual(try Day7.getAnswerPart2(input: example), 5905)
    }
    
    func test_day7_part2() {
        XCTAssertEqual(try Day7.getAnswerPart2(input: input), 253907829)
    }
}

