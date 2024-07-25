// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let klippaScannerXCFramework = Target.binaryTarget(
    name: "KlippaScanner",
    url: "https://custom-ocr.klippa.com/sdk/ios/spm/KlippaScanner/1.2.1-xcframework.zip",
    checksum: "1e6341fbe8a630a7949b6b13b24f0a7e9169cbdbfd328708784ce5182d4a6684"
)

let package = Package(
    name: "KlippaScannerSPM",
    products: [
        .library(
            name: "KlippaScannerSPM",
            targets: ["KlippaScanner", "KlippaScannerSPM"]),
    ],
    targets: [
        klippaScannerXCFramework,


        // Without at least one regular (non-binary) target, this package doesn't show up
        // in Xcode under "Frameworks, Libraries, and Embedded Content". That prevents
        // KlippaScanner from being embedded in the app product, causing the app to crash when
        // ran on a physical device. As a workaround, we can include a stub target
        // with at least one source file.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "KlippaScannerSPM"),
        .testTarget(
            name: "KlippaScannerSPMTests",
            dependencies: ["KlippaScannerSPM"]),
    ]
)
