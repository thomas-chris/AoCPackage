// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Common",
            targets: ["Common"]),
        .library(
            name: "TwentyFifteen",
            targets: ["TwentyFifteen"]),
        .library(
            name: "TwentyTwentyTwo",
            targets: ["TwentyTwentyTwo"]),
        .library(
            name: "TwentyTwentyThree",
            targets: ["TwentyTwentyThree"]),
        .library(
            name: "TwentyTwentyFour",
            targets: ["TwentyTwentyFour"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
        .package(url: "git@github.com:sharplet/Regex.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Common",
            dependencies: []),
        .target(
            name: "TwentyFifteen",
            dependencies: [
                "Common",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Regex", package: "Regex")
            ],
            resources: [
                .process("Inputs")
            ]
        ),
        .target(
            name: "TwentyTwentyTwo",
            dependencies: [
                "Common",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Regex", package: "Regex")
            ],
            resources: [
                .process("Inputs")
            ]
        ),
        .target(
            name: "TwentyTwentyThree",
            dependencies: [
                "Common",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Regex", package: "Regex")
            ],
            resources: [
                .process("Inputs")
            ]
        ),
        .target(
            name: "TwentyTwentyFour",
            dependencies: [
                "Common",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Regex", package: "Regex")
            ],
            resources: [
                .process("Inputs")
            ]
        ),
        .testTarget(
            name: "TwentyFifteenTests",
            dependencies: [
                "TwentyFifteen",
                "Common"
            ]),
        .testTarget(
            name: "TwentyTwentyTwoTests",
            dependencies: [
                "TwentyTwentyTwo",
                "Common"
            ]),
        .testTarget(
            name: "TwentyTwentyThreeTests",
            dependencies: [
                "TwentyTwentyThree",
                "Common"
            ]),
        .testTarget(
            name: "TwentyTwentyFourTests",
            dependencies: [
                "TwentyTwentyFour",
                "Common"
            ]),
    ],
    swiftLanguageModes: [.version("6")]
)
