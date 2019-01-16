//
//  CardView.swift
//  ReusableFramework
//
//  Created by JEEVAN TIWARI on 20/12/18.
//  Copyright © 2018 Book My Saloon. All rights reserved.
//

import UIKit

@IBDesignable
open class CardView: UIView {
    
    @IBInspectable open var cornerRadius: CGFloat = 10
    
    @IBInspectable open var shadowOffsetWidth: Int = 0
    @IBInspectable open var shadowOffsetHeight: Int = 0
    @IBInspectable open var shadowColor: UIColor? = UIColor.gray
    @IBInspectable open var shadowOpacity: Float = 0.5
    
    override open func layoutSubviews() {
        
        // backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
