// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let klippaScannerXCFramework = Target.binaryTarget(
    name: "KlippaScanner",
    url: "https://test.custom-ocr.klippa.com/sdk/ios/spm/KlippaScanner/2.2.4-rc3-test-xcframework.zip",
    checksum: "0779b67a9060e8cb605efed63726cf1021b6a3290029523c32b60f3e6580d439"
)

let package = Package(
    name: "KlippaScanner",
    products: [
        .library(
            name: "KlippaScanner",
            targets: ["KlippaScanner", "_KlippaScannerStub"]
        ),
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
            name: "_KlippaScannerStub"
        )
    ]
)
