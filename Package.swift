// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let klippaScannerXCFramework = Target.binaryTarget(
    name: "KlippaScanner",
    url: "https://custom-ocr.klippa.com/sdk/ios/spm/KlippaScanner/2.1.2-xcframework.zip",
    checksum: "c717a64092770f36a96bad686da1bb2def94a24fcabd088aca238fd185bd4164"
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
