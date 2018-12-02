//
//  SchemeViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 15/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class SchemeViewModel {
    
    private var scheme: Scheme?

    init(forScheme scheme: Scheme) {
        self.scheme = scheme
        
    }
}

extension SchemeViewModel: SchemeViewModelType {
    var schemeName: String {
        guard let schemeName = scheme?.schemeName else { return "" }
        return schemeName
    }
    func getListViewModel() -> CanvasViewModelType? {
        let schemeCanvasRelation = scheme?.relationWithCanvas
        guard let entity = schemeCanvasRelation?.allObjects.first as? CanvasEntity else { return nil }
        
        return CanvasViewModel(withEntity: entity, withCanvasName: schemeName)
    }
    
    
}
