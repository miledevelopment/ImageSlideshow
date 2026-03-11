// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ImageSlideshow",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ImageSlideshow",
            targets: ["ImageSlideshow"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.8.0")
    ],
    targets: [
        .target(
            name: "ImageSlideshow",
            dependencies: ["Kingfisher"],
            path: "ImageSlideshow",
            resources: [
                .process("Assets")
            ]
        )
    ]
)
