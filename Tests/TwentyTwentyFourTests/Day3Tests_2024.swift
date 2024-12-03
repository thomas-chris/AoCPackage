import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay3 {
    
    let input = Input.array(seperator: "\n", file: "Day3_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day3Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day3_part1Example() {
        #expect(Day3.getAnswerPart1(input: example) == 161)
    }
    
    @Test func test_day3_part1() {
        #expect(Day3.getAnswerPart1(input: input) == 179834255)
    }
    
    @Test func test_day3_part2_Example() {
        #expect(Day3.getAnswerPart2(input: example) == 48)
    }
    
    @Test func test_day3_part2() {
        #expect(Day3.getAnswerPart2(input: input) == 80570939)
    }
    
    
}
