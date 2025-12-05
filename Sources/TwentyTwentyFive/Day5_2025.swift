//
//  Day5_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 5, 2025.
//

import Algorithms
import Common
import Regex

public struct Day5 {
    public static func getAnswerPart1(input: String) -> Int {
        let results = parse(input)

        var fresh = Set<Int>()
        results.1.forEach { availableId in
            results.0.forEach { ingridientSet in
                if ingridientSet.lowerBound <= availableId && ingridientSet.upperBound >= availableId {
                    fresh.insert(availableId)
                }
            }
        }
        return fresh.count
    }

    public static func getAnswerPart2(input: String) -> Int {
        let results = parse(input)

        // Merge overlapping ranges and count total coverage
        let mergedRanges = mergeRanges(results.0)

        // Count total values in merged ranges
        return mergedRanges.reduce(0) { total, range in
            total + (range.upperBound - range.lowerBound + 1)
        }
    }

    private static func mergeRanges(_ ranges: [ClosedRange<Int>]) -> [ClosedRange<Int>] {
        guard !ranges.isEmpty else { return [] }

        // Sort ranges by their start points
        let sortedRanges = ranges.sorted { $0.lowerBound < $1.lowerBound }

        var merged: [ClosedRange<Int>] = [sortedRanges[0]]

        for currentRange in sortedRanges.dropFirst() {
            let lastMerged = merged[merged.count - 1]

            // Check if current range overlaps with or is adjacent to the last merged range
            if currentRange.lowerBound <= lastMerged.upperBound + 1 {
                // Merge ranges by extending the upper bound
                let newUpperBound = max(lastMerged.upperBound, currentRange.upperBound)
                merged[merged.count - 1] = lastMerged.lowerBound...newUpperBound
            } else {
                // No overlap, add as new range
                merged.append(currentRange)
            }
        }

        return merged
    }

    private static func parse(_ input: String) -> ([ClosedRange<Int>], [Int]) {

        var ingridientIds: [ClosedRange<Int>] = []
        var available: [Int] = []

        let split = input.components(separatedBy: "\n\n")
        split[0].components(separatedBy: "\n").forEach { line in
            let ids = line.components(separatedBy: "-")
            ingridientIds.append(ids[0].toInt...ids[1].toInt)
        }

        split[1].components(separatedBy: "\n").forEach { line in
            available.append(String(line).toInt)
        }

        return (ingridientIds, available)

    }
}

extension String {
    var toInt: Int {
        return Int(self.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
    }
}

