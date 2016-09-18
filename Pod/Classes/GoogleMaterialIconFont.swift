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
        let filename = "MaterialIcons-Regular"
        let fontname = "Material Icons"

        if UIFont.fontNamesForFamilyName(fontname).isEmpty {
            dispatch_once(&onceToken, { () -> Void in
                FontLoader.loadFont(filename)
            })
        }
        
        guard let font = UIFont(name: fontname, size: size) else {
            fatalError("\(fontname) not found")
        }
        return font
    }
}

private class FontLoader {
    class func loadFont(name: String) {
        let bundle = NSBundle(forClass: FontLoader.self)
        let identifier = bundle.bundleIdentifier
        let fileExtension = "ttf"
        
        let url: NSURL?
        if identifier?.hasPrefix("org.cocoapods") == true {
            url = bundle.URLForResource(name, withExtension: fileExtension, subdirectory: "GoogleMaterialIconFont.bundle")
        } else {
            url = bundle.URLForResource(name, withExtension: fileExtension)
        }
        
        guard let fontURL = url else { fatalError("\(name) not found in bundle") }
        
        guard let data = NSData(contentsOfURL: fontURL),
            let provider = CGDataProviderCreateWithCFData(data) else { return }
        let font = CGFontCreateWithDataProvider(provider)
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
