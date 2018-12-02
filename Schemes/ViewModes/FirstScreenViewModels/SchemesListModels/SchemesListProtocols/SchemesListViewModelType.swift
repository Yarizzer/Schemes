//
//  SchemesListViewModelType.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation

protocol SchemesListViewModelType {
    //TableView needs
    func getItemsCount() -> Int
    func selectedIndexPath(forIndexPath indexPath: IndexPath?)
    func getSchemeListCellViewModel(forIndexPath indexPath: IndexPath) -> SchemesListCellViewModelType?
    func updateSchemesArray()
    
    //work with items
    func removeItem()
    
    //transaction to other VC's
    func getSchemeSettingsViewModel() -> SchemeSettingsModelType?
    func getCanvasListViewModel() -> CanvasListViewModelType?
}
