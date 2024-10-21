# Klippa Scanner SPM

## SDK License
Please be aware you need to have a license to use this SDK.
If you would like to use our scanner, please contact us [here](https://www.klippa.com/en/ocr/ocr-sdk/)

## Getting started

To install the Klippa Scanner SDK using SPM you will need a username and password, if you don't have a username/password yet please contact us [here](https://www.klippa.com/en/ocr/ocr-sdk/).

Navigate to your `.netrc` file in `/Users/{your-username}/.netrc` if it does not exist yet you can make it.
Add the following to the `.netrc`:

```netrc
machine custom-ocr.klippa.com
login {your-username}
password {your-password}
```

Replace the `{your-username}` and `{your-password}` values with the ones provided by Klippa.

In case you want to use `keychain access` instead of `.netrc` you can also do the following:

1. Open keychain access > `file` > `New Password Item...`
2. Keychain Item Name: > `custom-ocr.klippa.com`
3. Account Name: > `{your-username}`
4. Password: > `{your-password}`

Replace the `{your-username}` and `{your-password}` values with the ones provided by Klippa.

Next you can follow https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app

1. In Xcode, select “File” → “Add Packages...”
2. Enter https://github.com/klippa-app/klippa-scanner-spm.git

or you can add the following dependency to your Package.swift:

`.package(url: "https://github.com/klippa-app/klippa-scanner-spm", from: "0.0.2")`
