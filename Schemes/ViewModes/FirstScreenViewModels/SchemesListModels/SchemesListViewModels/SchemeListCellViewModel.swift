//
//  SchemeListCellViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class SchemeListCellViewModel {
    private var schemeObject: SchemeObject?
    init(forSchemeObject schemeObject: SchemeObject) {
        self.schemeObject = schemeObject
    }
}

extension SchemeListCellViewModel: SchemesListCellViewModelType {
    
    func schemeName() -> String {
        guard let _schemeName = scheme?.schemeName else { return "schemeName is not set" }
        return _schemeName
    }
    
    func schemeCreationDate() -> String {
        guard let _schemeDate = scheme?.creationDate else { return "date is not set" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: _schemeDate as Date)
    }
    
    func schemeTitleColor() -> UIColor {
        guard let _schemeTitleColor_ = scheme?.titleColor as? Array<Float> else { return UIColor.black }
        return convertFloatsToUIColor(withFloatArray: _schemeTitleColor_)
    }
    
    func convertFloatsToUIColor(withFloatArray floatArray: Array<Float>) -> UIColor {
        let colorToReturn = UIColor(red: CGFloat(floatArray[0]),
                                    green: CGFloat(floatArray[1]),
                                    blue: CGFloat(floatArray[2]),
                                    alpha: CGFloat(floatArray[3]))
        return colorToReturn
    }
    
    func borderColor() -> UIColor {
        guard let _borderColor_ = scheme?.borderColor as? Array<Float> else { return UIColor.black }
        return convertFloatsToUIColor(withFloatArray: _borderColor_)
    }

}
