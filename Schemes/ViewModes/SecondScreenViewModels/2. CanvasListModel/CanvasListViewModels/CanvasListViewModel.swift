//
//  CanvasListViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 06/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation

class CanvasListViewModel {
    private var scheme: Scheme
    private var arrayOfCanvases: [CanvasEntity]
    init(scheme: Scheme) {
        self.scheme = scheme
//        self.arrayOfCanvases = MainDataBaseManager.shared.getCanvasArray(forScheme: scheme)
        self.arrayOfCanvases = [CanvasEntity]()
    }
}

extension CanvasListViewModel: CanvasListViewModelType {
//    func itemsCount() -> Int {
//        return MainDataBaseManager.shared.getCanvasArray(forScheme: scheme).count
//    }
//    
//    private func updateCanvasArray() {
//        arrayOfCanvases = MainDataBaseManager.shared.getCanvasArray(forScheme: scheme)
//    }
//    
//    func alreadyExistCanvas(with text: String) -> Bool {
//        for i in arrayOfCanvases {
//            if i.canvasName == text {
//                return true
//            }
//        }
//        return false
//    }
//    func addNewCanvas(canvasTitle title: String) {
//        MainDataBaseManager.shared.addNewCanvas(withTitle: title, forScheme: scheme)
//        updateCanvasArray()
//    }
//    func renameCanvas(atIndexPath indexPath: IndexPath, newName name: String) {
//        
//        MainDataBaseManager.shared.renameCanvas(forCanvas: arrayOfCanvases[indexPath.row], newName: name)
//        updateCanvasArray()
//    }
//    func removeCanvas(forIndexPath indexPath: IndexPath)
//    func selectedIndexPath(forIndexPath indexPath: IndexPath)
}
