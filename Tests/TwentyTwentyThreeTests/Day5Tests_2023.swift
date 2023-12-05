import XCTest
import TwentyTwentyThree
import Common

class TestsDay5: XCTestCase {
    
    let input = Input.array(seperator: "\n\n", file: "Day5_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n\n", file: "Day5Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day5_part1Example() throws {
        XCTAssertEqual(try Day5.getAnswerPart1(input: example), 35)
    }
    
    func test_day5_part1() {
        XCTAssertEqual(try Day5.getAnswerPart1(input: input), 18519)
    }
    
    func test_day5_part2Example() {
        XCTAssertEqual(try Day5.getAnswerPart2(input: example), 30)
    }
    
    func test_day5_part2() {
        XCTAssertEqual(try Day5.getAnswerPart2(input: input), 87449461)
    }
}

