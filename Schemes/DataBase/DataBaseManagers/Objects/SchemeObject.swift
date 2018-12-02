//
//  SchemeObject.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class SchemeObject {
    var schemeEntity: Scheme?
    var title: String
    var titleColor: Array<Float>
    var borderColor: Array<Float>
    var order: Int
    
    func getFloatArray(fromColor color: UIColor) -> Array<Float> {
        return convertColorToFloats(color: color)
    }
    
    private func convertColorToFloats(color: UIColor) -> Array<Float> {
        var arrayToReturn = [Float]()
        guard let components = color.cgColor.components else { return arrayToReturn }
        for i in components {
            print(i)
            arrayToReturn.append(Float(i))
        }
        return arrayToReturn
    }
    
    func getColor(fromFloatArray floatsArray: Array<Float>) -> UIColor {
        return convertFloatsToColor(floatsArray: floatsArray)
    }
    
    private func convertFloatsToColor(floatsArray: Array<Float>) -> UIColor {
        
        let colorToReturn = UIColor(red: CGFloat(floatsArray[0]), green: CGFloat(floatsArray[0]), blue: CGFloat(floatsArray[0]), alpha: CGFloat(floatsArray[0]))
        
        return colorToReturn
    }
    
    
    init(forSchemeEntity _schemeEntity_: Scheme?, withTitle _title_: String, titleColor _titleColor_: Array<Float>, borderColor _borderColor_: Array<Float>, order _order_: Int) {
        self.schemeEntity = _schemeEntity_
        self.title = _title_
        self.titleColor = _titleColor_
        self.borderColor = _borderColor_
        self.order = _order_
    }
}
