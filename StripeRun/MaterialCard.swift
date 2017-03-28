//
//  MaterialCard.swift
//  StripeRun
//
//  Created by Brandon Sanchez on 3/28/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import Foundation
import UIKit

/*
 Material Card UIView
 :- created to prevent issues with configuring cell at runtime
 */
public class MaterialCard: UIView {
    
    open var cornerRadius: CGFloat = 0
    
    open var shadowOffsetWidth: Int = 0
    open var shadowOffsetHeight: Int = 0
    open var shadowColor: UIColor? = UIColor.black
    open var shadowOpacity: Float = 0.5
    
    override open func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        //layer.shadowPath = shadowPath.cgPath
    }
   
        
}
