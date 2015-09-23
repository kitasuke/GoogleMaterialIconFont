//
//  GoogleMaterialIconFont.swift
//  Pods
//
//  Created by Yusuke Kita on 9/23/15.
//
//

import UIKit

public extension String {
    public static func materialIcon(font: MaterialIconFont) -> String {
        return IconFont.codes[font.rawValue]
    }
}

public extension NSString {
    public static func materialIcon(font: MaterialIconFont) -> NSString {
        return NSString(string: String.materialIcon(font))
    }
}

public extension UIFont {
    public static func materialIconOfSize(size: CGFloat) -> UIFont {
        var onceToken: dispatch_once_t = 0
        let name = "GoogleMaterialIconFont"
        
        if UIFont.fontNamesForFamilyName(name).count == 0 {
            dispatch_once(&onceToken, { () -> Void in
                FontLoader.loadFont(name)
            })
        }
        return UIFont(name: name, size: size)!
    }
}

private class FontLoader {
    class func loadFont(name: String) {
        let bundle = NSBundle(forClass: FontLoader.self)
        let identifier = bundle.bundleIdentifier
        let fileExtension = "ttf"
        
        let fontURL: NSURL
        if identifier?.hasPrefix("org.cocoapods") == true {
            fontURL = bundle.URLForResource(name, withExtension: fileExtension, subdirectory: "GoogleMaterialIconFont.bundle")!
        } else {
            fontURL = bundle.URLForResource(name, withExtension: fileExtension)!
        }
        
        let data = NSData(contentsOfURL: fontURL)
        let provider = CGDataProviderCreateWithCFData(data)
        let font = CGFontCreateWithDataProvider(provider)!
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
