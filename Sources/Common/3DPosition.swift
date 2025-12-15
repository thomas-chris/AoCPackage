import Foundation

public struct ThreeDPosition: Hashable {
    public let x: Int
    public let y: Int
    public let z: Int

    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    public func move(by vector: ThreeDVector) -> ThreeDPosition {
        ThreeDPosition(x: self.x + vector.x, y: self.y + vector.y, z: self.z + vector.z)
    }

    public func vector(to position: ThreeDPosition) -> ThreeDVector {
        ThreeDVector(x: position.x - self.x, y: position.y - self.y, z: position.z - self.z)
    }

    public func manhattan(to position: ThreeDPosition) -> Int {
        abs(self.x - position.x) + abs(self.y - position.y) + abs(self.z - position.z)
    }

    public func euclidean(to position: ThreeDPosition) -> Double {
        let dx = Double(self.x - position.x)
        let dy = Double(self.y - position.y)
        let dz = Double(self.z - position.z)
        return (dx * dx + dy * dy + dz * dz).squareRoot()
    }
}


public struct ThreeDVector: Hashable {
    public let x: Int
    public let y: Int
    public let z: Int

    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}
