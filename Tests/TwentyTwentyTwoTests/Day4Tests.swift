import XCTest
import TwentyTwentyTwo
import Common


class TestsDay4: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day4", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day4Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    func test_day4_part1_example() {
        XCTAssertEqual(Day4.part1(example), 2)
    }
    
    func test_day4_part1() {
        XCTAssertEqual(Day4.part1(input), 560)
    }
    
    func test_day4_example() throws {
        XCTAssertEqual(try Day4.part2(example), 4)
    }
    
    func test_day4_part2() throws {
        measure {
            XCTAssertEqual(try? Day4.part2(input), 839)
        }
    }
}

