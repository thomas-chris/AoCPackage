public struct Cuboid: Hashable {
    public var x: ClosedRange<Int>
    public var y: ClosedRange<Int>
    public var z: ClosedRange<Int>
    
    public init(x: ClosedRange<Int>, y: ClosedRange<Int>, z: ClosedRange<Int>){
        self.x = x
        self.y = y
        self.z = z
    }
}

public extension Cuboid {
    
    var points: Int { x.magnitude * y.magnitude * z.magnitude }
    
    func isSuperset(of other: Cuboid) -> Bool {
        x.isSuperset(of: other.x)
        && y.isSuperset(of: other.y)
        && z.isSuperset(of: other.z)
    }
    
    func intersects(with other: Cuboid) -> Bool {
        x.overlaps(other.x)
        && y.overlaps(other.y)
        && z.overlaps(other.z)
    }
    
    func union(with other: Cuboid) -> Set<Cuboid> {
        guard intersects(with: other) else { return [self, other] }
        
        if other.isSuperset(of: self) { return [other] }
        
        var sets: Set<Cuboid> = []
        sets.insert(other)
        
        let xRanges = x.split(over: other.x)
        let yRanges = y.split(over: other.y)
        let zRanges = z.split(over: other.z)
        
        xRanges.forEach { xRange in
            yRanges.forEach { yRange in
                zRanges.forEach { zRange in
                    let new = Cuboid(x: xRange, y: yRange, z: zRange)
                    if other.isSuperset(of: new) { return }
                    sets.insert(new)
                }
            }
        }
        
        return sets
    }
}
