//
//  MainDataBaseManager.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation

class MainDataBaseManager {
    static let shared = MainDataBaseManager()
    
    private init() {}
    
    func getShemesArray() -> [Scheme] {
        return SchemeManager.shared.getSchemesFromDataBase()
    }
    
//    func getCanvasArray(forScheme scheme: Scheme) -> [CanvasEntity] {
//        return SchemeManager.shared.getCavasesFromDataBase(forSheme: scheme)
//    }
//
//    func getSchemesElementsArray(forCanvas canvas: CanvasEntity) -> [SchemeEntity] {
//        return SchemeManager.shared.getSchemesElementsFromDataBase(forCanvas: canvas)
//    }
    
    func peformARecordForScheme(withBoxDemands boxDemands: BoxDemands) {
        SchemeManager.shared.peformARecordForSchemeInDataBase(withBoxDemands: boxDemands)
    }
    
//    func addNewCanvas(withTitle title: String, forScheme scheme: Scheme) {
//        SchemeManager.shared.createACanvas(withTitle: title, forScheme: scheme)
//    }
//
//    func update(entityWithParams params: (SchemeEntity?, CanvasEntity, String, String, Float, Float)) -> SchemeEntity? {
//        return SchemeManager.shared.update(entityWithParams: params)
//    }
//
//    func renameCanvas(forCanvas canvas: CanvasEntity, newName name: String) {
////        SchemeManager.shared.rename(forCanvas: canvas, newName: name)
//    }
//
//    func renameScheme(forScheme scheme: Scheme, newName name: String) {
//        SchemeManager.shared.rename(forScheme: scheme, newName: name)
//    }
    
    func removeScheme(schemeToRemove scheme: Scheme) {
        SchemeManager.shared.removeScheme(schemeToRemove: scheme)
    }
//    
//    func removeSchemeEntity(entityToRemove entity: SchemeEntity) {
//        SchemeManager.shared.removeSchemeEntity(forEntity: entity)
//    }
//    
    func removeAllItems() {
        SchemeManager.shared.removeAllItems()
    }
}
