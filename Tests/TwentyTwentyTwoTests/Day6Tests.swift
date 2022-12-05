import XCTest
import TwentyTwentyTwo
import Common


class TestsDay6: XCTestCase {

    let input = Array(Input.array(seperator: ",", file: "Day6", bundle: .twentyTwentyTwo, compactmap:  { string in Int(string.replacingOccurrences(of: "\n", with: ""))! } ))
        
    let example = Array(Input.array(seperator: ",", file: "Day6Example", bundle: .twentyTwentyTwo, compactmap:  { string in Int(string.replacingOccurrences(of: "\n", with: ""))! } ))
    
    func test_day6_part1_example() throws {
        XCTAssertEqual(try Day6.part1(example, turns: 18), 26)
        XCTAssertEqual(try Day6.part1(example, turns: 80), 5934)
    }
    
    func test_day6_part1() {
        XCTAssertEqual(try Day6.part1(input, turns: 80), 393019)
    }

    func test_day6_part2_example() throws {
        XCTAssertEqual(try Day6.part1(example, turns: 256), 26984457539)
    }

    func test_day5_part2() throws {
        measure {
            XCTAssertEqual(try? Day6.part1(input, turns: 256), 1757714216975)
        }
    }
}

