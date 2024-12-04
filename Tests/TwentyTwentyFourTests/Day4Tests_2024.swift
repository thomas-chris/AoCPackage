import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay4 {
    
    let input = Input.array(seperator: "\n", file: "Day4_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day4Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day4_part1Example() {
        #expect(Day4.getAnswerPart1(input: example) == 18)
    }
    
    @Test func test_day4_part1() {
        #expect(Day4.getAnswerPart1(input: input) == 2646)
    }
    
    @Test func test_day4_part2_Example() {
        #expect(Day4.getAnswerPart2(input: example) == 9)
    }
    
    @Test func test_day4_part2() {
        #expect(Day4.getAnswerPart2(input: input) == 2000)
    }
    
    
}
