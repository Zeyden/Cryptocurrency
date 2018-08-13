//
//  BgGradientView.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import UIKit

class BgGradientView: UIView {
    
    private let kGradientName = "Gradient"
    private var gradientLayer: CAGradientLayer?
    
    var gradientFrame: CGRect? {
        get {
            return gradientLayer?.frame
        }
        set {
            if let gradientLayer = gradientLayer {
                gradientLayer.frame = newValue ?? CGRect.zero
            }
        }
    }
    
    func addGradientLayer(from: CGPoint, to: CGPoint, colors: [CGColor], frame: CGRect? = nil) {
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = frame ?? self.frame
        gradientLayer?.colors = colors
        gradientLayer?.startPoint = from
        gradientLayer?.endPoint = to
        gradientLayer?.name = kGradientName
        
        self.layer.addSublayer(gradientLayer!)
    }
    
    
    func removeGradientLayer() {
        if let gradientLayer = gradientLayer {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }

}
