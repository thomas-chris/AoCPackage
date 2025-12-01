import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay1 {

    let input = Input.array(seperator: "\n", file: "Day1_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day1Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })

    @Test func day1_part1Example() {
        #expect(Day1.getAnswerPart1(input: example) == 3)
    }

    @Test func test_day1_part1() {
        #expect(Day1.getAnswerPart1(input: input) == 1182)
    }

    @Test func test_day1_part2_Example() {
        #expect(Day1.getAnswerPart2(input: example) == 6)
    }

    @Test func test_day1_part2() {
        #expect(Day1.getAnswerPart2(input: input) == 6907)  // Correct answer!
    }


}

