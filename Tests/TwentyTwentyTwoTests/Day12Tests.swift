import XCTest
import TwentyTwentyTwo
import Common


class TestsDay12: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day12", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day12Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    let pjInput = Array(Input.array(seperator: "\n", file: "Day12PJ", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    func test_day12_part1_example() {
        XCTAssertEqual(Day12.part1(example), 10)
    }
    
    func test_day12_part1() {
        XCTAssertEqual(Day12.part1(input), 4413)
    }
    
    func test_day12_example() throws {
        XCTAssertEqual(try Day12.part2(example), 36)
    }
    
    func test_day12_part2() throws {
        measure {
            XCTAssertEqual(try? Day12.part2(input), 118803)
        }
    }
}

