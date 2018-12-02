//
//  itemViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 27/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class ItemViewModel {
    
    var canvasEntity: CanvasEntity
    var schemeEntity: SchemeEntity?
    
    private var itemView = ItemView()
    
    init(canvasEntity _cEntity: CanvasEntity, schemeEntity _sEntity: SchemeEntity?) {
        self.canvasEntity = _cEntity
        self.schemeEntity = _sEntity
        self.itemView = ItemView(withModel: self)
    }
}

extension ItemViewModel: ItemViewModelType {
    
    var titleText: String {
        guard let entityTitle = schemeEntity?.title else { return "" }
        return entityTitle
    }
    
    var discriptionText: String {
        guard let entitySubtitle = schemeEntity?.subtitle else { return "" }
        return entitySubtitle
    }
    
    func getItemView() -> ItemView {
        return itemView
    }
    
    func saveItem() {
        let _canvasEntity = canvasEntity
        let _schemeEntity = schemeEntity
        let _title = itemView.titleTextField.text!.isEmpty ? "<Untitled>" : itemView.titleTextField.text!
        let _subtitle = itemView.discriptionTextField.text ?? ""
        let _xPosition = itemView.frame.origin.x
        let _yPosition = itemView.frame.origin.y
        let params = (_schemeEntity, _canvasEntity, _title, _subtitle, Float(_xPosition), Float(_yPosition))
        
//        if !MainDataBaseManager.shared.items(withSameTitle: _title).isEmpty {
//            print(MainDataBaseManager.shared.items(withSameTitle: _title).first?.objectID == schemeEntity?.objectID)
//        }
        
//        if MainDataBaseManager.shared.items(withSameTitle: _title).isEmpty &&
//            MainDataBaseManager.shared.items(withSameTitle: _title).first?.objectID == schemeEntity?.objectID {
//            // saving item
//        } else {
//
//        }
        
//        if schemeEntity == nil {
//            //Creating a new element need to update schemEntity
//
//        } else {
//            schemeEntity = MainDataBaseManager.shared.update(entityWithParams: params)
//        }
        
    }
    
    func terminateItem() {
        itemView.animateTerminating()
        guard let entityToTerminate = schemeEntity else { return }
//        MainDataBaseManager.shared.removeSchemeEntity(entityToRemove: entityToTerminate)
    }

}
