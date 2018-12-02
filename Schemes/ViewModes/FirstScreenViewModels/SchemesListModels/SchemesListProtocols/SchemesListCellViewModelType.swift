//
//  SchemesListCellViewModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

protocol SchemesListCellViewModelType {
    func schemeName() -> String
    func schemeCreationDate() -> String
    func schemeTitleColor() -> UIColor
    func convertFloatsToUIColor(withFloatArray floatArray: Array<Float>) -> UIColor
    func borderColor() -> UIColor
}
