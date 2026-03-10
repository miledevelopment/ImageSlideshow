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
        // external libraries
        .package(url: "https://github.com/zvonicek/ImageSlideshow.git", from: "1.8.1"),
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", from: "4.2.0"),
        .package(url: "https://github.com/AFNetworking/AFNetworking.git", from: "4.0.0"),
        .package(url: "https://github.com/rs/SDWebImage.git", from: "5.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/ParsePlatform/Parse-SDK-iOS-OSX.git", from: "1.19.0")
    ],
    targets: [
        .target(
            name: "ImageSlideshow",
            dependencies: [
                "AlamofireImage",
                "AFNetworking",
                "SDWebImage",
                "Kingfisher",
                "Parse"
            ],
            path: "ImageSlideshow"
        )
    ]
)
