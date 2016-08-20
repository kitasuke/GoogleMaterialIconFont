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
    private static let fontLoaderHandler: (String) -> Void = {
        FontLoader.loadFont($0)
    }
    
    public static func materialIconOfSize(_ size: CGFloat) -> UIFont {
        let filename = "MaterialIcons-Regular"
        let fontname = "Material Icons"

        if UIFont.fontNames(forFamilyName: fontname).count == 0 {
            fontLoaderHandler(filename)
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
        switch identifier?.hasPrefix("org.cocoapods") {
        case (let cocoapods?) where cocoapods:
            guard let url = bundle.url(forResource: name, withExtension: fileExtension, subdirectory: "GoogleMaterialIconFont.bundle") else { fatalError("\(name) not found")}
            fontURL = url
        default:
            guard let url = bundle.url(forResource: name, withExtension: fileExtension) else { fatalError("\(name) not found") }
            fontURL = url
        }
        
        guard let data = try? Data(contentsOf: fontURL),
            let cfData = data as? CFData,
            let provider = CGDataProvider(data: cfData) else { return }
        let font = CGFont(provider)
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            guard let error = error,
                let nsError = error.takeUnretainedValue() as? NSError else { return }
            
            let errorDescription: CFString = CFErrorCopyDescription(error.takeUnretainedValue())
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
