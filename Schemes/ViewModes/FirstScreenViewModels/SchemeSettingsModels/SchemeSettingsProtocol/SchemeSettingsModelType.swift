//
//  SchemeSettingsModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 06/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

protocol SchemeSettingsModelType {
    //getting schemeData for vc
    func getSchemeName() -> String?
    func getTitleColor() -> UIColor
    func getBorderColor() -> UIColor
    //saving data
    func getScheme() -> Scheme?     //needs for BoxDemands passing process
    func getOrder() -> Int
    func saveChanges(toBoxWithDemands boxDemands: BoxDemands)
}
