//
//  CanvasEntity+CoreDataProperties.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 08/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
//

import Foundation
import CoreData


extension CanvasEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CanvasEntity> {
        return NSFetchRequest<CanvasEntity>(entityName: "CanvasEntity")
    }

    @NSManaged public var canvasBorderColor: NSObject?
    @NSManaged public var canvasGradientEndColor: NSObject?
    @NSManaged public var canvasGradientStartColor: NSObject?
    @NSManaged public var canvasHeight: Float
    @NSManaged public var canvasName: String?
    @NSManaged public var canvasWidh: Float
    @NSManaged public var relationWithSceme: Scheme?
    @NSManaged public var relationWithSchemeEntity: NSSet?

}

// MARK: Generated accessors for relationWithSchemeEntity
extension CanvasEntity {

    @objc(addRelationWithSchemeEntityObject:)
    @NSManaged public func addToRelationWithSchemeEntity(_ value: SchemeEntity)

    @objc(removeRelationWithSchemeEntityObject:)
    @NSManaged public func removeFromRelationWithSchemeEntity(_ value: SchemeEntity)

    @objc(addRelationWithSchemeEntity:)
    @NSManaged public func addToRelationWithSchemeEntity(_ values: NSSet)

    @objc(removeRelationWithSchemeEntity:)
    @NSManaged public func removeFromRelationWithSchemeEntity(_ values: NSSet)

}
