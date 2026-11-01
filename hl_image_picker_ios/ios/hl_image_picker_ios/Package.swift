// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hl_image_picker_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "hl-image-picker-ios", targets: ["hl_image_picker_ios"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // The versions the CocoaPods build was locked to.
        .package(url: "https://github.com/tilltue/TLPhotoPicker.git", exact: "2.1.21"),
        .package(url: "https://github.com/TimOliver/TOCropViewController.git", exact: "2.6.0")
    ],
    targets: [
        .target(
            name: "hl_image_picker_ios",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "TLPhotoPicker", package: "TLPhotoPicker"),
                .product(name: "CropViewController", package: "TOCropViewController")
            ]
        )
    ]
)
