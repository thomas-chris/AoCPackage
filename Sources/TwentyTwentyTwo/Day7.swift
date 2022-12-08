import Algorithms
import Foundation
import Regex
import Common

public struct Day7 {
    
    public static func part1(_ input: [String]) -> Int {
        let root = parse(input)
        
        return traverseTreePart1(total: 0, directory: root)
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        let requiredSpace = 30000000
        let fileSystemSize = 70000000
        let root = parse(input)
        let spaceNeeded = requiredSpace - (fileSystemSize - root.size)
        
        return traverseTreePart2(spaceNeeded: spaceNeeded, directory: root, smallestOption: root).size
    }
    
    private static func traverseTreePart1(total: Int, directory: Directory) -> Int {
        var total = total
        let size = directory.size
        if size <= 100000 {
            total += size
        }
        
        for item in directory.contents {
            if let directory = item as? Directory {
                total = traverseTreePart1(total: total, directory: directory)
            }
        }
        
        return total
    }
    
    private static func traverseTreePart2(spaceNeeded: Int, directory: Directory, smallestOption: Directory) -> Directory {
        var smallestOption = smallestOption
        
        if directory.size > spaceNeeded && directory.size < smallestOption.size {
            smallestOption = directory
        }
        
        for item in directory.contents {
            if let directory = item as? Directory {
                smallestOption = traverseTreePart2(spaceNeeded: spaceNeeded, directory: directory, smallestOption: smallestOption)
            }
        }
        
        return smallestOption
        
    }
    
    private static func parse(_ input: [String]) -> Directory {
        let root = Directory(name: "/", parent: nil, contents: [])
        
        var currentDirectory = root
        
        for line in input {
            let components = line.components(separatedBy: " ")
            switch components[0] {
            // instruction
            case "$":
                switch components[1] {
                //change directory
                case "cd":
                    // directory to go to
                    switch components[2] {
                    // go to root
                    case "/":
                        currentDirectory = root
                    // go up a level
                    case "..":
                        if let parent = currentDirectory.parent {
                            currentDirectory = parent
                        }
                    // go in to a directory
                    default:
                        if let child = currentDirectory.contents.first(where: { item in item.name == components[2] }) as? Directory {
                            currentDirectory = child
                        } else {
                            let directory = Directory(name: components[2], parent: currentDirectory, contents: [])
                            currentDirectory.contents.append(directory)
                            currentDirectory = directory
                        }
                    }
                case "ls":
                    //ignore as this just lists it out
                    break
                default:
                    // switch on string so need a default case
                    break
                }
            case "dir":
                // new directory to add
                currentDirectory.contents.append(Directory(name: components[1], parent: currentDirectory, contents: []))
            default:
                // file
                currentDirectory.contents.append(File(name: components[1], size: Int(components[0]) ?? 0))
            }
        }
        
        return root
    }
    
    struct File: Item {
        let name: String
        let size: Int
    }
    
    class Directory: Item {
        let name: String
        let parent: Directory?
        var contents: [Item]
        
        private var calculatedSpace: Int?
        
        var size: Int {
            if let calculatedSpace {
                return calculatedSpace
            }
            calculatedSpace = contents.reduce(0) {
                $0 + $1.size
            }
            
            return calculatedSpace ?? 0
        }
        
        init(name: String, parent: Directory?, contents: [Item]) {
            self.name = name
            self.parent = parent
            self.contents = contents
        }
    }
}

protocol Item {
    var name: String { get }
    var size: Int { get }
}
