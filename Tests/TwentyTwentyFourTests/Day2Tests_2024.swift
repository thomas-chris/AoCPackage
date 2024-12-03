import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay2 {
    
    let input = Input.array(seperator: "\n", file: "Day2_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day2Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day2_part1Example() {
        #expect(Day2.getAnswerPart1(input: example) == 2)
    }
    
    @Test func test_day2_part1() {
        #expect(Day2.getAnswerPart1(input: input) == 236)
    }
    
    @Test func test_day2_part2_Example() {
        #expect(Day2.getAnswerPart2(input: example) == 4)
    }
    
    @Test func test_day2_part2() {
        #expect(Day2.getAnswerPart2(input: input) == 308)
    }
    
    
}
