//
//  CustomImages.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 20/01/22.
//

import Foundation
import UIKit

class CustomImage : UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusImage()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusImage()
    }
    
    func setRadiusImage() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
