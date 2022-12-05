import XCTest
import TwentyTwentyTwo
import Common

class TestsDay14: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day14", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day14Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())

    func test_day14_part1_example() {
        XCTAssertEqual(Day14.part1(example, turns: 10), 1588)
    }

    func test_day14_part1() {
        XCTAssertEqual(Day14.part1(input, turns: 10), 2233)
    }
    
    func test_day14_example() throws {
        XCTAssertEqual(Day14.part1(example, turns: 40), 2188189693529)
    }
    
    func test_day14_part2() throws {
//        measure {
        XCTAssertEqual(Day14.part1(input, turns: 40), 2884513602164)
//        }
    }
}

