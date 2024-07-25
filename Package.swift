// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let klippaScannerXCFramework = Target.binaryTarget(
    name: "KlippaScanner",
    url: "https://custom-ocr.klippa.com/sdk/ios/spm/KlippaScanner/1.2.2-xcframework.zip",
    checksum: "2ef08ba4ebe82cfc2d702cf309a84380e0971edb96772672df7b06e1ab9fb853"
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
