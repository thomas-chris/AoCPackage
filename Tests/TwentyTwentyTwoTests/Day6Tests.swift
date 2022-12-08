import XCTest
import TwentyTwentyTwo
import Common


class TestsDay6: XCTestCase {

    let input = Input.getInputString(name: "Day6", bundle: .twentyTwentyTwo)
        
    let example = Input.getInputString(name: "Day6Example", bundle: .twentyTwentyTwo)
    
    func test_day6_part1_example() throws {
        XCTAssertEqual(Day6.part1(example), 7)
    }
    
    func test_day6_part1() {
        XCTAssertEqual(Day6.part1(input), 1655)
    }

    func test_day6_part2_example() throws {
        XCTAssertEqual(Day6.part2(example), 19)
    }

    func test_day5_part2() throws {
        measure {
            XCTAssertEqual(Day6.part2(input), 2665)
        }
    }
}

