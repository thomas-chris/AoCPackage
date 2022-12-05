import XCTest
import TwentyTwentyTwo
import Common


class TestsDay2: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day2", bundle: .twentyTwentyTwo, compactmap:  { string in string } )
        .dropLast())
                      
    let example = Array(Input.array(seperator: "\n", file: "Day2Example", bundle: .twentyTwentyTwo, compactmap:  { string in string } )
        .dropLast())
    
    func test_day2_part1() {
        XCTAssertEqual(Day2.getAnswerPart1(input: input), 12535)
    }
    
    func test_day2_example() {
        XCTAssertEqual(Day2.part2(example), 12)
    }
    
    func test_day2_part2() {
        XCTAssertEqual(Day2.part2(input), 15457)
    }
}

