// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let klippaScannerXCFramework = Target.binaryTarget(
    name: "KlippaScanner",
    url: "https://custom-ocr.klippa.com/sdk/ios/spm/KlippaScanner/2.1.1-xcframework.zip",
    checksum: "79aa9c4b1ac645a76ac1a770134015a04547da9fb9a0cca10044a116385ded0a"
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
