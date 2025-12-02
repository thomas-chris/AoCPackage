import Foundation

// Test the regex pattern
let regex = try! NSRegularExpression(pattern: #"^(\w+?)\1+$"#)

let testCases = [
    "1111",      // Should match (1 repeated 4 times)
    "1112",      // Should NOT match
    "123123",    // Should match (123 repeated 2 times)
    "123123123", // Should match (123 repeated 3 times)
    "123123124", // Should NOT match
    "abab",      // Should match (ab repeated 2 times)
    "ababab",    // Should match (ab repeated 3 times)
    "abc",       // Should NOT match (no repetition)
    "aaa",       // Should match (a repeated 3 times)
    "aa",        // Should match (a repeated 2 times)
    "a"          // Should NOT match (needs at least 2 repetitions)
]

print("Testing regex pattern: ^(\\w+?)\\1+$")
print(String(repeating: "=", count: 40))

for testCase in testCases {
    let range = NSRange(testCase.startIndex..<testCase.endIndex, in: testCase)
    let match = regex.firstMatch(in: testCase, options: [], range: range)

    if let match = match {
        let capturedGroup = String(testCase[Range(match.range(at: 1), in: testCase)!])
        print("✅ '\(testCase)' matches - repeating pattern: '\(capturedGroup)'")
    } else {
        print("❌ '\(testCase)' does not match")
    }
}
