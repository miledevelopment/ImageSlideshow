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
    dependencies: [],
    targets: [
        .target(
            name: "ImageSlideshow",
            path: "ImageSlideshow",
            resources: [
                .process("Assets")
            ]
        )
    ]
)
