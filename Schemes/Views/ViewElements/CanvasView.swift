//
//  CanvasView.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 17/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    var canvasEntity: CanvasEntity? {
        didSet {
            var canvasSize: CGSize {
                if let canvasWidth = canvasEntity?.canvasWidh, let canvasHeight = canvasEntity?.canvasHeight {
                    return CGSize(width: CGFloat(canvasWidth), height: CGFloat(canvasHeight))
                } else { return UIScreen.main.bounds.size }
            }
            
            self.frame.size = canvasSize
            self.tag = 1
            self.sizeToFit()
            //
            let startGradientColorsArray = canvasEntity?.canvasGradientStartColor as! Array<CGFloat>
            let endGradientColorsArray = canvasEntity?.canvasGradientEndColor as! Array<CGFloat>
            
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = UIColor(red: startGradientColorsArray[0], green: startGradientColorsArray[1], blue: startGradientColorsArray[2], alpha: startGradientColorsArray[3])
            let endColor = UIColor(red: endGradientColorsArray[0], green: endGradientColorsArray[1], blue: endGradientColorsArray[2], alpha: endGradientColorsArray[3])
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            //            gradientLayer.locations = [0, 0.2, 1]
            gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
            
            let backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
//            self.backgroundColor = backgroundColor
            self.layer.addSublayer(gradientLayer)

            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            let borderColorArray = canvasEntity?.canvasBorderColor as! Array<CGFloat>
            let borderColor = UIColor(red: borderColorArray[0], green: borderColorArray[1], blue: borderColorArray[2], alpha: borderColorArray[3])
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = 1
            
            print(self.layer.sublayers)
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
