//
//  CardView.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 saran. All rights reserved.
//

import UIKit

class CardView: UIView {
    var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    var shadowRadius: CGFloat = 2.0
    var shadowOpacity: Float = 0.75
    var cornerRadius: CGFloat = 3.0
    var bgColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }
    func applyStyle() {
        self.backgroundColor = bgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
    }
}
