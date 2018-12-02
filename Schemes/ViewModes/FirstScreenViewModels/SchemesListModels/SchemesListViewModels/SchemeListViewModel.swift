//
//  SchemeListViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation

class SchemeListViewModel {
    private var schemesArray = [Scheme]()
//    private var schemesElemenstArray = [SchemeEntity]()
    private var currentIndex: IndexPath?

    private func deleteAllItems() {
        MainDataBaseManager.shared.removeAllItems()
    }
    
    init() {
//        deleteAllItems()
        updateSchemesArray()
    }
}

extension SchemeListViewModel: SchemesListViewModelType {
    //TableView needs
    func getItemsCount() -> Int {
        return schemesArray.count
    }
    
    func selectedIndexPath(forIndexPath indexPath: IndexPath?) {
        currentIndex = indexPath
    }
    
    func getSchemeListCellViewModel(forIndexPath indexPath: IndexPath) -> SchemesListCellViewModelType? {
        return SchemeListCellViewModel(forSchemeObject: SchemeObject(forSchemeEntity: <#T##Scheme?#>, withTitle: <#T##String#>, titleColor: <#T##Array<Float>#>, borderColor: <#T##Array<Float>#>, order: <#T##Int#>)) (forScheme: schemesArray[indexPath.row])
    }
    
    func updateSchemesArray() {
        schemesArray = MainDataBaseManager.shared.getShemesArray()
    }
    
    //Working with items
    func removeItem() {
        guard let currIndex = currentIndex else { return }
        let scheme = schemesArray[currIndex.row]
        MainDataBaseManager.shared.removeScheme(schemeToRemove: scheme)
        updateSchemesArray()
    }
    
    //transaction to other VC's
    func getSchemeSettingsViewModel() -> SchemeSettingsModelType? {
        guard let selectedIndexPath = currentIndex else { return SchemeSettingsViewModel(withOrder: getItemsCount() + 1, modelForScheme: nil) }
        let scheme = schemesArray[selectedIndexPath.row]
        return SchemeSettingsViewModel(withOrder: Int(scheme.userOrder), modelForScheme: scheme)
    }
    
    func getCanvasListViewModel() -> CanvasListViewModelType? {
        guard let selectedIndexPath = currentIndex else { return nil }
        let scheme = schemesArray[selectedIndexPath.row]
        return CanvasListViewModel(scheme: scheme)
        
    }
    
}
