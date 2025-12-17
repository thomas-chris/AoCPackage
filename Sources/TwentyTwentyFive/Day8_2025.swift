//
//  Day8_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 8, 2025.
//

import Algorithms
import Common
import Regex

public struct Day8 {
    public static func getAnswerPart1(input: [String], junctions: Int) -> Int {

        let pointsAndDistances = input.map { line in
            let components = line.components(separatedBy: ",").compactMap { Int($0) }
            return ThreeDPosition(x: components[0], y: components[1], z: components[2])
        }
            .euclideanDistancePairs()

        let orderedKeys = pointsAndDistances
            .keys
            .sorted()
            .prefix(junctions)

        var lines = [Set<ThreeDPosition>]()

        orderedKeys.enumerated().forEach { index, key in
            let distances = pointsAndDistances[key]!
            var added = false
            for i in 0..<lines.count {
                var set = lines[i]
                let point1 = distances.first!.0
                let point2 = distances.first!.1
                if set.contains(point1) && set.contains(point2) {
                    lines[i] = set
                    added = true

                } else if set.contains(point1) || set.contains(point2) {
                    set.insert(point1)
                    set.insert(point2)
                    lines[i] = set
                    added = true
                }
            }

            if !added {

                let newSet = Set<ThreeDPosition>([distances.first!.0, distances.first!.1])
                lines.append(newSet)
            }

        }

        var oldCount = lines.count
        var newCount = 0

        // combine until all sets are full
        while oldCount != newCount {
            oldCount = lines.count
            for i in 0..<lines.count {
                for j in 0..<lines.count {
                    if i != j {
                        if i < lines.count && j < lines.count {
                            var set1 = lines[i]
                            let set2 = lines[j]
                            if set1.isDisjoint(with: set2) == false {
                                set1.formUnion(set2)
                                lines[i] = set1
                                lines.remove(at: j)
                            }
                        }
                    }
                }

            }
            newCount = lines.count
        }

        lines.sort { $0.count > $1.count }
        return lines[0].count * lines[1].count * lines[2].count
    }

    public static func getAnswerPart2(input: [String]) -> Int {


        let points = input.map { line in
            let components = line.components(separatedBy: ",").compactMap { Int($0) }
            return ThreeDPosition(x: components[0], y: components[1], z: components[2])
        }

        let pointsAndDistances = points.euclideanDistancePairs()

        let pairs = pointsAndDistances
            .sorted { $0.key < $1.key }
            .compactMap {
                $0.value.first
            }

        var groups: [Set<ThreeDPosition>] = []
        for pair in pairs {
            reduceGroups(with: pair, &groups)

            if groups.count == 1, groups.first!.count == points.count {
                return pair.0.x * pair.1.x
            }
        }

        return 0
    }

    private static func reduceGroups(with pair: (ThreeDPosition, ThreeDPosition), _ groups: inout [Set<ThreeDPosition>]) {
        var newGroup = Set([pair.0, pair.1])
        var newGroups: [Set<ThreeDPosition>] = []

        for group in groups {
            if group.intersection(newGroup).count > 0 {
                newGroup = newGroup.union(group)
            } else {
                newGroups.append(group)
            }
        }

        newGroups.append(newGroup)
        groups = newGroups
    }

    
}
