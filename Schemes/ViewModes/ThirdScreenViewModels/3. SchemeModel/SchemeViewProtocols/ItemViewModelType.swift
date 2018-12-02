//
//  itemViewModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 27/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

protocol ItemViewModelType {
    var titleText: String { get }
    var discriptionText: String { get }
    func getItemView() -> ItemView
    func saveItem()
    func terminateItem()
}
