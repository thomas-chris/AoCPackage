
import Foundation

public class Vertex {

    public var identifier: Position
    public var neighbors: [(Vertex, Double)] = []
    public var pathLengthFromStart = Double.infinity
    public var pathVerticesFromStart: [Vertex] = []

    public init(identifier: Position) {
        self.identifier = identifier
    }

    public func clearCache() {
        pathLengthFromStart = Double.infinity
        pathVerticesFromStart = []
    }
}

extension Vertex: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        identifier.hash(into: &hasher)
    }
}

extension Vertex: Equatable {
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
