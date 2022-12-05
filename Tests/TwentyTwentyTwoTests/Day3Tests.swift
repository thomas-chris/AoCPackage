import XCTest
import TwentyTwentyTwo
import Common


class TestsDay3: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day3", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day3Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    func test_day3_part1_example() {
        XCTAssertEqual(Day3.part1(example), 157)
    }
    
    func test_day3_part1() {
        XCTAssertEqual(Day3.part1(input), 7746)
    }
    
    func test_day3_example() {
        XCTAssertEqual(Day3.part2(example), 70)
    }
    
    func test_day3_part2() {
        measure {
            XCTAssertEqual(Day3.part2(input), 2604)
        }
    }
}

