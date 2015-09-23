# GoogleMaterialIconFont

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/kitasuke/GoogleMaterialIconFont)
[![CI Status](http://img.shields.io/travis/kitasuke/GoogleMaterialIconFont.svg?style=flat)](https://travis-ci.org/kitasuke/GoogleMaterialIconFont)
[![Version](https://img.shields.io/cocoapods/v/GoogleMaterialIconFont.svg?style=flat)](http://cocoapods.org/pods/GoogleMaterialIconFont)
[![License](https://img.shields.io/cocoapods/l/GoogleMaterialIconFont.svg?style=flat)](http://cocoapods.org/pods/GoogleMaterialIconFont)
[![Platform](https://img.shields.io/cocoapods/p/GoogleMaterialIconFont.svg?style=flat)](http://cocoapods.org/pods/GoogleMaterialIconFont)

Google Material Design Icons for Swift or ObjC project

This library is inspired by [FontAwesome.swift](https://github.com/thii/FontAwesome.swift)  
Both Swift and Objctive-C are supported  
See example project or [Material icons](https://www.google.com/design/icons/) more detail

## Usage

### Swift

import `GoogleMaterialIconFont`

```swift
label.text = String.materialIcon(.Favorite)
label.font = UIFont.materialIconOfSize(32)
```

### Objective-C

import `#import <GoogleMaterialIconFont/GoogleMaterialIconFont-Swift.h>`

```objc
label.text = [NSString materialIcon:MaterialIconFontFavoriteBorder];
label.font = [UIFont materialIconOfSize:32];
```

## Requirements

iOS8 or later  
Swift 1.2 or later  
Xcode 6.3 or later  

## Installation

### CocoaPods

GoogleMaterialIconFont is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GoogleMaterialIconFont"
```

Then, run `pod install`

In case you haven't installed CocoaPods yet, run the following command

```terminal
$ gem install cocoapods
```

### Carthage

GoogleMaterialIconFont is available through Carthage.

To install GoogleMaterialIconFont into your Xcode project using Carthage, specify it in your Cartfile:

`github "kitasuke/GoogleMaterialIconFont"`
Then, run carthage update

You can see `Carthage/Build/iOS/GoogleMaterialIconFont.framework` now, so drag and drop it to `Embedded Binaries` in `General` menu tab with your project.

In case you haven't installed Carthage yet, run the following command

```ternimal
$ brew update
$ brew install carthage
```

### Manual

Copy all the files in `Pod` directory into your project.
Make sure that `GoogleMaterialIconFont.ttf` is specified into `Fonts provided by application` in your project's `info.plist`

## Author

kitasuke

## License

This library uses [material-design-icons by Google](https://github.com/google/material-design-icons) to create icon font file which is `GoogleMaterialIconFont.ttf`. Therefore, `GoogleMaterialIconFont.ttf` is available under the [Creative Common Attribution 4.0 International License (CC-BY 4.0)](http://creativecommons.org/licenses/by/4.0/)

GoogleMaterialIconFont is available under the MIT license. See the LICENSE file for more info.
