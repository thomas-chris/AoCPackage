//
//  Day9_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 9, 2025.
//

import Algorithms
import Common
import CoreGraphics
import Regex

public struct Day9 {
    public static func getAnswerPart1(input: [String]) -> Int {

        return input.map { line in
            let components = line.components(separatedBy: ",").compactMap { Int($0) }
            return Position(x: components[0], y: components[1])
        }
            .combinations(ofCount: 2)
            .map { positions in
                let maxX = max(positions.first!.x, positions.last!.x)
                let minX = min(positions.first!.x, positions.last!.x)
                let maxY = max(positions.first!.y, positions.last!.y)
                let minY = min(positions.first!.y, positions.last!.y)

                return (maxX - minX + 1) * (maxY - minY + 1)
            }
            .max() ?? 0
    }

    public static func getAnswerPart2(input: [String]) -> Int {

        let data = input
            .map { $0
                .split(separator: ",")
                .compactMap { Int($0) }
            }

        let redGreenTiles = CGMutablePath()
        var firstPoint = true

        for vertex in data {
            if firstPoint {
                redGreenTiles.move(to: CGPoint(x: vertex[0], y: vertex[1]))
                firstPoint = false
            } else {
                redGreenTiles.addLine(to: CGPoint(x: vertex[0], y: vertex[1]))
            }
        }
        redGreenTiles.closeSubpath()

        var maxArea = 0
        for (i, vertex1) in data.enumerated() {
            for vertex2 in data[i+1..<input.count] {

                let rectangle = CGRect(
                    origin: CGPoint(x: vertex1[0], y: vertex1[1]),
                    size: CGSize(width: vertex2[0] - vertex1[0], height: vertex2[1] - vertex1[1])
                )

                let rectanglePath = CGPath.init(
                    rect: rectangle,
                    transform: nil
                )

                let intersection = redGreenTiles.intersection(rectanglePath)
                var intersectionRect = CGRect.zero
                intersection.isRect(&intersectionRect)

                let epsilon = 1e-6
                if abs(intersectionRect.width - rectangle.width) < epsilon &&
                    abs(intersectionRect.height - rectangle.height) < epsilon {
                    maxArea = max(maxArea, (abs(vertex1[0] - vertex2[0]) + 1) * (abs(vertex1[1] - vertex2[1]) + 1))
                }
            }
        }
        return maxArea
    }
}
