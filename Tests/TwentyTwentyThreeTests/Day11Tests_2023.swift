import XCTest
import TwentyTwentyThree
import Common

class TestsDay11: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day11_2023", bundle: .twentyTwentyThree, compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    let example = Input.array(seperator: "\n", file: "Day11Example_2023", bundle: .twentyTwentyThree,  compactmap: { $0 != "" ? $0 : nil }).compactMap { $0 }
    
    func test_day11_part1Example() throws {
        XCTAssertEqual(try Day11.getAnswerPart1(input: example), 374)
    }
    
    func test_day11_part1() {
        XCTAssertEqual(try Day11.getAnswerPart1(input: input), 9627977)
    }
    
    func test_day11_part2_example_10() {
        XCTAssertEqual(try Day11.getAnswerPart2(input: example, expansion: 9), 1030)
    }
    
    func test_day11_part2_example_100() {
        XCTAssertEqual(try Day11.getAnswerPart2(input: example, expansion: 8410), 1030)
    }
    
    func test_day11_part2() {
        XCTAssertEqual(try Day11.getAnswerPart2(input: input, expansion: 999999), 644248339497)
    }
}

