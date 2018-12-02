//
//  CanvasViewModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 19/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

protocol  CanvasViewModelType {
    func getCanvasName() -> String
    func getCanvasSize() -> CGSize
    func getCanvasView() -> UIView
    
}
