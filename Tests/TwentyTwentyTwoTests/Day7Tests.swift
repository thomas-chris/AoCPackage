import XCTest
import TwentyTwentyTwo
import Common

class TestsDay7: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day7", bundle: .twentyTwentyTwo, compactmap:  { $0 } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day7Example", bundle: .twentyTwentyTwo, compactmap:  { $0 } ).dropLast())
    
    func test_day7_part1_example() throws {
        XCTAssertEqual(Day7.part1(example), 95437)
    }
    
    func test_day7_part1() {
        XCTAssertEqual(Day7.part1(input), 1428881)
    }

    func test_day7_part2_example() throws {
        XCTAssertEqual(try Day7.part2(example), 24933642)
    }

    func test_day7_part2() throws {
        measure {
            XCTAssertEqual(try? Day7.part2(input), 10475598)
        }
    }
}

