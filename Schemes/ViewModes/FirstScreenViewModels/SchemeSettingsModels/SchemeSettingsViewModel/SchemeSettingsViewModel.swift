//
//  SchemeSettingsViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 06/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class SchemeSettingsViewModel {
    var scheme: Scheme?
    var order: Int?
    var numberOfSections = 2
    init(withOrder order: Int, modelForScheme scheme: Scheme?) {
        self.scheme = scheme
        self.order = order
    }
}

extension SchemeSettingsViewModel: SchemeSettingsModelType {
    //getting schemeData for vc
    func getSchemeName() -> String? {
        guard let _schemeName_ = scheme?.schemeName else { return nil }
        return _schemeName_
    }
    
    func getTitleColor() -> UIColor {
        
    }
    
    func getBorderColor() -> UIColor {
        
    }
    
    func getScheme() -> Scheme? {
        guard let _scheme_ = scheme else { return nil }
        return _scheme_
    }
    
    func getOrder() -> Int {
        guard let _order_ = order else { return 0 }
        return _order_
    }
    
    func saveChanges(toBoxWithDemands boxDemands: BoxDemands) {
        MainDataBaseManager.shared.peformARecordForScheme(withBoxDemands: boxDemands)
    }

}
