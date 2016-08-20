//
//  GoogleMaterialIconFont.swift
//  Pods
//
//  Created by Yusuke Kita on 9/23/15.
//
//

import UIKit

public extension String {
    public static func materialIcon(_ font: MaterialIconFont) -> String {
        return IconFont.codes[font.rawValue]
    }
}

public extension NSString {
    public static func materialIcon(_ font: MaterialIconFont) -> NSString {
        return NSString(string: String.materialIcon(font))
    }
}

public extension UIFont {
    public static func materialIconOfSize(_ size: CGFloat) -> UIFont {
        var onceToken: Int = 0
        let filename = "MaterialIcons-Regular"
        let fontname = "Material Icons"

        if UIFont.fontNames(forFamilyName: fontname).count == 0 {
            dispatch_once(&onceToken, { () -> Void in
                FontLoader.loadFont(filename)
            })
        }
        return UIFont(name: fontname, size: size)!
    }
}

private class FontLoader {
    class func loadFont(_ name: String) {
        let bundle = Bundle(for: FontLoader.self)
        let identifier = bundle.bundleIdentifier
        let fileExtension = "ttf"
        
        let fontURL: URL
        if identifier?.hasPrefix("org.cocoapods") == true {
            fontURL = bundle.url(forResource: name, withExtension: fileExtension, subdirectory: "GoogleMaterialIconFont.bundle")!
        } else {
            fontURL = bundle.url(forResource: name, withExtension: fileExtension)!
        }
        
        let data = try? Data(contentsOf: fontURL)
        let provider = CGDataProvider(data: data as! CFData)
        let font = CGFont(provider!)
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
