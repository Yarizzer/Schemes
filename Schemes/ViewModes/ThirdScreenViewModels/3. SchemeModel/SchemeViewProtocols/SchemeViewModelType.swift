//
//  SchemeViewModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 15/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

protocol SchemeViewModelType {
    var schemeName: String { get }
    func getListViewModel() -> CanvasViewModelType?
    
}
