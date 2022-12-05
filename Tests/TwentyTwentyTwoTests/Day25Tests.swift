import XCTest
import TwentyTwentyTwo
import Common


class TestsDay25: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day25", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    let example = Array(Input.array(seperator: "\n", file: "Day25Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    let simpleExample = Array(Input.array(seperator: "\n", file: "Day25SimpleExample", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
// DOESNT COMPLETE
//    func test_simple_example() {
//
//        XCTAssertEqual(Day25.part1(simpleExample), 58)
//    }
    func test_day1_part1_example() {
        XCTAssertEqual(Day25.part1(example), 58)
    }
    
    func test_day1_part1() {
        XCTAssertEqual(Day25.part1(input), 360)
    }
}

