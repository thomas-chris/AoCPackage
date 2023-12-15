import XCTest
import TwentyTwentyThree
import Common

class TestsDay10: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day10_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day10Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example2 = Input.array(seperator: "\n", file: "Day10Example2_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    
    func test_day10_part1Example() throws {
        XCTAssertEqual(try Day10.getAnswerPart1(input: example), 8)
    }
    
    func test_day10_part1() {
        XCTAssertEqual(try Day10.getAnswerPart1(input: input), 6823)
    }
    
    func test_day10_part2_example() {
        XCTAssertEqual(try Day10.getAnswerPart2(input: example2), 4)
    }
    
    func test_day10_part2() {
        XCTAssertEqual(try Day10.getAnswerPart2(input: input), 975)
    }
}

