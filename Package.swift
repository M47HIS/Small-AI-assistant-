// swift-tools-version: 5.9

import Foundation
import PackageDescription

let packageRoot = URL(fileURLWithPath: #filePath).deletingLastPathComponent().path
let infoPlistPath = "\(packageRoot)/Sources/RightKey/Resources/Info.plist"

let package = Package(
    name: "RightKey",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "RightKey", targets: ["RightKey"])
    ],
    targets: [
        .executableTarget(
            name: "RightKey",
            path: "Sources/RightKey",
            linkerSettings: [
                .unsafeFlags(["-sectcreate", "__TEXT", "__info_plist", infoPlistPath])
            ]
        ),
        .testTarget(
            name: "RightKeyTests",
            dependencies: ["RightKey"],
            path: "Tests/RightKeyTests"
        )
    ]
)
