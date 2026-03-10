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
        .package(url: "https://github.com/AFNetworking/AFNetworking.git", from: "4.0.0"),
        .package(url: "https://github.com/rs/SDWebImage.git", from: "5.0.0"),
        .package(url: "https://github.com/ParsePlatform/Parse-SDK-iOS-OSX.git", from: "1.19.0")
    ],
    targets: [
        .target(
            name: "ImageSlideshow",
            dependencies: [
                "AFNetworking",
                "SDWebImage",
                "Parse"
            ],
            path: "ImageSlideshow",
            resources: [
                .process("Assets")
            ]
        )
    ]
)
