# TinyLayout

[![CI Status](https://img.shields.io/travis/SinetGroup/TinyLayout.svg)](https://travis-ci.org/SinetGroup/TinyLayout)
[![Version](https://img.shields.io/cocoapods/v/TinyLayout.svg)](https://cocoapods.org/pods/TinyLayout)
[![License](https://img.shields.io/cocoapods/l/TinyLayout.svg?)](https://cocoapods.org/pods/TinyLayout)
[![Platform](https://img.shields.io/cocoapods/p/TinyLayout.svg)](https://cocoapods.org/pods/TinyLayout)
[![Downloads](https://img.shields.io/cocoapods/dt/TinyLayout.svg)](https://cocoapods.org/pods/TinyLayout)

## Installation

TinyLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TinyLayout'
```

## Usage

```swift
container.fill(superView)
titleLabel.leading(to: container.leading, constant: 15).top(to: container.top, constant: 10).trailing(to: container.trailing, constant: -15)
subTitle.leading(to: titleLabel.leading).top(to: titleLabel.bottom, constant: 10).width(to: titleLabel.width)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Sinet Group, http://sinetgroup.ru/

## License

TinyLayout is available under the MIT license. See the LICENSE file for more info.
