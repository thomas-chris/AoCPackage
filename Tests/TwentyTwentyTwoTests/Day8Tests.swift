import XCTest
import TwentyTwentyTwo
import Common

class TestsDay8: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day8", bundle: .twentyTwentyTwo, compactmap:  { $0 } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day8Example", bundle: .twentyTwentyTwo, compactmap:  { $0 } ).dropLast())
    
    func test_day8_part1_example() {
        XCTAssertEqual(Day8.part1(example), 21)
    }
    
    func test_day8_part1() {
        XCTAssertEqual(Day8.part1(input), 1705)
    }

    func test_day8_part2_example() {
        XCTAssertEqual(Day8.part2(example), 8)
    }

    func test_day8_part2() {
//        measure {
            XCTAssertEqual(Day8.part2(input), 371200)
//        }
    }
}

