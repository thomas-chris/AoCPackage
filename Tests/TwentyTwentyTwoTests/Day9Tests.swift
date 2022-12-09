import XCTest
import TwentyTwentyTwo
import Common

class TestsDay9: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day9", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day9Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    let example2 = Array(Input.array(seperator: "\n", file: "Day9Example2", bundle: .twentyTwentyTwo, compactmap:  { string in string } ).dropLast())
    
    func test_day9_part1_example() {
        XCTAssertEqual(Day9.part1(example), 13)
    }
    
    func test_day9_part1() {
        XCTAssertEqual(Day9.part1(input), 6067)
    }
    
    func test_day9_example() throws {
        XCTAssertEqual(try Day9.part2(example), 1)
    }
    
    func test_day9_example2() throws {
        XCTAssertEqual(try Day9.part2(example2), 36)
    }
    
    func test_day9_part2() throws {
        measure {
            XCTAssertEqual(try? Day9.part2(input), 2471)
        }
    }
}

