//
//  SchemeManager.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SchemeManager {
    static let shared = SchemeManager()
    
    private init() {}
    
    //gets schemes list for SchemesListTableView
    func getSchemesFromDataBase() -> [Scheme] {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()

        var arrayToReturn = [Scheme]()
        do {
            let arrayOfSchemesInDataBase = try context.fetch(fetchRequest)
            guard !arrayOfSchemesInDataBase.isEmpty else { return arrayToReturn }
            arrayToReturn = arrayOfSchemesInDataBase.sorted {$0.userOrder < $1.userOrder }
        } catch {
            print(error.localizedDescription)
        }
        return arrayToReturn
    }
    
    //gets array of canvases for scheme
//    func getCavasesFromDataBase(forSheme scheme: Scheme) -> [CanvasEntity] {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "relationWithSceme = %@", scheme)
//
//        var arrayToReturn = [CanvasEntity]()
//        do {
//            let arrayOfElementsInDataBase = try context.fetch(fetchRequest)
//            guard !arrayOfElementsInDataBase.isEmpty else { return arrayToReturn }
//            arrayToReturn = arrayOfElementsInDataBase.sorted {$0.canvasName! < $1.canvasName! }
//        } catch {
//            print(error.localizedDescription)
//        }
//        return arrayToReturn
//    }
    
    //gets schemeItems for canvas
//    func getSchemesElementsFromDataBase(forCanvas canvas: CanvasEntity) -> [SchemeEntity] {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<SchemeEntity> = SchemeEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "relationWithCanvas = %@", canvas)
//        var arrayToReturn = [SchemeEntity]()
//        do {
//            let arrayOfElementsInDataBase = try context.fetch(fetchRequest)
//            guard !arrayOfElementsInDataBase.isEmpty else { return arrayToReturn }
////            arrayToReturn = arrayOfElementsInDataBase.sorted {$0.piority < $1.piority }
//            arrayToReturn = arrayOfElementsInDataBase
//        } catch {
//            print(error.localizedDescription)
//        }
//
//        return arrayToReturn
//    }

    // MARK: - Creation a new box
    func peformARecordForSchemeInDataBase(withBoxDemands boxDemands: BoxDemands) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        if let scheme = boxDemands.box {
            let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "SELF = %@", scheme)
            do {
                let entity = try context.fetch(fetchRequest).first
                entity?.borderColor = boxDemands.borderColor as NSObject
                entity?.schemeName = boxDemands.title
                entity?.titleColor = boxDemands.titleColor as NSObject
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        } else {
            let entity = NSEntityDescription.entity(forEntityName: "Scheme", in: context)
            let schemeObject = NSManagedObject(entity: entity!, insertInto: context) as! Scheme
            schemeObject.schemeName = boxDemands.title
            schemeObject.borderColor = boxDemands.borderColor as NSObject
            schemeObject.titleColor = boxDemands.titleColor as NSObject
            
            schemeObject.defaultBorderColor =  boxDemands.borderColor as NSObject
            schemeObject.defaultTitleColor = boxDemands.titleColor as NSObject
            schemeObject.userOrder = Int16(boxDemands.order)
            
            let date = Date() as NSDate
            schemeObject.creationDate = date
            
            do {
                try context.save()
                //            createACanvas(withTitle: "\(title)_DefaultCanvas", forScheme: schemeObject)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func reindexOrder() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
        do {
            let arrayOfSchemes = try context.fetch(fetchRequest).sorted{ $0.userOrder < $1.userOrder}
            guard !arrayOfSchemes.isEmpty else { return }
            var c = 0
            for i in arrayOfSchemes {
                c += 1
                i.userOrder = Int16(c)
            }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    //Adding a new scheme: STEP_2 Craeting a dafaul canvas for new scheme
//    func createACanvas(withTitle title: String, forScheme scheme: Scheme) {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "CanvasEntity", in: context)
//        let canvasObject = NSManagedObject(entity: entity!, insertInto: context) as! CanvasEntity
////        let color_1 = #colorLiteral(red: 0.0009580758143, green: 0.5139852521, blue: 0.9686274529, alpha: 1)
////        let color_2 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//        canvasObject.canvasGradientStartColor = [0.0009580758143, 0.5139852521, 0.9686274529, 1] as NSObject
//        canvasObject.canvasGradientEndColor = [0.4745098054, 0.8392156959, 0.9764705896, 1] as NSObject
//        canvasObject.canvasBorderColor = [0.8039215803, 0.8039215803, 0.8039215803, 1] as NSObject
//        canvasObject.canvasHeight = Float(1000)
//        canvasObject.canvasWidh = Float(1000)
//        canvasObject.canvasName = title
//        canvasObject.relationWithSceme = scheme
//
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    //Creation/saving an item
//    func update(entityWithParams params: (_schemeEntity: SchemeEntity?, _canvasEntity: CanvasEntity, _title: String, _subtitle: String, _xPosition: Float, _yPosition: Float)) -> SchemeEntity? {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//
//        var entityToReturn: SchemeEntity?
//
//        if params._schemeEntity == nil {
//            let entity = NSEntityDescription.entity(forEntityName: "SchemeEntity", in: context)
//            let entityObject = NSManagedObject(entity: entity!, insertInto: context) as! SchemeEntity
//            entityObject.title = params._title
//            entityObject.subtitle = params._subtitle
//            entityObject.relationWithCanvas = params._canvasEntity
//            entityObject.creationDate = Date() as NSDate
//            entityObject.xPosition = params._xPosition
//            entityObject.yPosition = params._yPosition
//            print(entityObject.objectID)
//            do {
//                try context.save()
//                entityToReturn = entityObject
//            } catch {
//                print(error.localizedDescription)
//            }
//        } else {
//            let fetchRequest: NSFetchRequest<SchemeEntity> = SchemeEntity.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "SELF = %@", params._schemeEntity!.objectID)
//
//            do {
//                if let entity = try context.fetch(fetchRequest).first {
//                    entity.title = params._title
//                    entity.subtitle = params._subtitle
//                    entity.relationWithCanvas = params._canvasEntity
//                    entity.xPosition = params._xPosition
//                    entity.yPosition = params._yPosition
//                    try context.save()
//                    entityToReturn = entity
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return entityToReturn
//    }
//
//    //Rename a scheme: STEP_1 renaming a scheme
//    func rename(forScheme scheme: Scheme, newName name: String) {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "schemeName = %@", scheme.schemeName)
//
//        do {
//
//            for item in try context.fetch(fetchRequest) {
//                let canvasArray = item.relationWithCanvas?.allObjects
//                for canvas in canvasArray as! [CanvasEntity] {
//                    changeNamesFoCanvases(forCanvas: canvas, withSchemeName: name)
//                }
//            }
//            try context.save()
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    //Rename a scheme: STEP_2 renaming a canvas
    
//    func rename(forCanvas: canvas, newName: name) {
//        rename(forScheme scheme: Scheme, newName name: String) {
//            let delegate = UIApplication.shared.delegate as! AppDelegate
//            let context = delegate.persistentContainer.viewContext
//            let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "schemeName = %@", scheme.schemeName!)
//            
//            do {
//                
//                for item in try context.fetch(fetchRequest) {
//                    let canvasArray = item.relationWithCanvas?.allObjects
//                    for canvas in canvasArray as! [CanvasEntity] {
//                        changeNamesFoCanvases(forCanvas: canvas, withSchemeName: name)
//                    }
//                }
//                try context.save()
//                
//            } catch {
//                print(error.localizedDescription)
//            }
//    }
    
//    private func changeNamesFoCanvases(forCanvas canvas: CanvasEntity, withSchemeName newSchemeName: String) {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
//
//        fetchRequest.predicate = NSPredicate(format: "canvasName = %@", canvas.canvasName!)
//        do {
//            let canvasResult = try context.fetch(fetchRequest).first
//            guard let canvas = canvasResult, let canvasName = canvasResult?.canvasName else { return }
//
//            let separateWords = canvasName.split(separator: "_")
//            let newCanvasName = newSchemeName + "_" + separateWords[1]
//            canvas.canvasName = newCanvasName
//
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    
    func removeScheme(schemeToRemove scheme: Scheme) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext


        let fetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "SELF = %@", scheme.objectID)

        do {

            for scheme in try context.fetch(fetchRequest) {
                context.delete(scheme)
            }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        reindexOrder()
    }
    
//    func removeCanvas(forCanvas canvas: CanvasEntity) {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//
//
//        let fetchRequest: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "canvasName = %@", canvas.canvasName!)
//
//        do {
//
//            for canvas in try context.fetch(fetchRequest) {
//                let entitiesArray = canvas.relationWithSchemeEntity?.allObjects
//                for entity in entitiesArray as! [SchemeEntity] {
//                    removeSchemeEntity(forEntity: entity)
//                }
//                context.delete(canvas)
//            }
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func removeSchemeEntity(forEntity entity: SchemeEntity) {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//
//        let fetchRequest: NSFetchRequest<SchemeEntity> = SchemeEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "SELF = %@", entity.objectID)
////        fetchRequest.predicate = NSPredicate(format: "objectID = %@", entity.objectID)
//
//        do {
//            for item in try context.fetch(fetchRequest) {
//                context.delete(item)
//            }
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    func removeAllItems() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let schemeFetchRequest: NSFetchRequest<Scheme> = Scheme.fetchRequest()
        do {
            for item in try context.fetch(schemeFetchRequest) {
                context.delete(item)
            }

        } catch {
            print(error.localizedDescription)
        }
        let canvasFetchRequest: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
        do {
            for item in try context.fetch(canvasFetchRequest) {
                context.delete(item)
            }
        } catch {
            print(error.localizedDescription)
        }
        let elementsFetchRequest: NSFetchRequest<SchemeEntity> = SchemeEntity.fetchRequest()
        do {
            for item in try context.fetch(elementsFetchRequest) {
                context.delete(item)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    

}


