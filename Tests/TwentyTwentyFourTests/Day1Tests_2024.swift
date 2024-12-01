import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay1 {
    
    let input = Input.array(seperator: "\n", file: "Day1_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day1Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day1_part1Example() {
        #expect(Day1.getAnswerPart1(input: example) == 11)
    }
    
    @Test func test_day1_part1() {
        #expect(Day1.getAnswerPart1(input: input) == 3569916)
    }
    
    @Test func test_day1_part2_Example() {
        #expect(Day1.getAnswerPart2(input: example) == 31)
    }
    
    @Test func test_day1_part2() {
        #expect(Day1.getAnswerPart2(input: input) == 26407426)
    }
    
    
}

class PerfTesting: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day1_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day1Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    func test_day1_part1_perfTest() {
        measure {
            XCTAssertEqual(Day1.getAnswerPart1(input: input), 3569916)
        }
    }
}
