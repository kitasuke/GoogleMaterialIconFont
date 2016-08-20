//
//  CollectionViewCell.swift
//  GoogleMaterialIconFont
//
//  Created by Yusuke Kita on 9/23/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import GoogleMaterialIconFont

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    
    func setup(_ font: MaterialIconFont) {
        label.text = String.materialIcon(font)
        label.font = UIFont.materialIconOfSize(32)
        label.textColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}
