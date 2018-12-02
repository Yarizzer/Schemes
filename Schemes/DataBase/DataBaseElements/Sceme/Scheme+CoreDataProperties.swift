//
//  Scheme+CoreDataProperties.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 12/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
//

import Foundation
import CoreData


extension Scheme {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scheme> {
        return NSFetchRequest<Scheme>(entityName: "Scheme")
    }

    @NSManaged public var borderColor: NSObject?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var defaultBorderColor: NSObject?
    @NSManaged public var defaultBorderWidth: Int16
    @NSManaged public var defaultTitleColor: NSObject?
    @NSManaged public var schemeName: String?
    @NSManaged public var titleColor: NSObject?
    @NSManaged public var userOrder: Int16
    @NSManaged public var relationWithCanvas: NSSet?

}

// MARK: Generated accessors for relationWithCanvas
extension Scheme {

    @objc(addRelationWithCanvasObject:)
    @NSManaged public func addToRelationWithCanvas(_ value: CanvasEntity)

    @objc(removeRelationWithCanvasObject:)
    @NSManaged public func removeFromRelationWithCanvas(_ value: CanvasEntity)

    @objc(addRelationWithCanvas:)
    @NSManaged public func addToRelationWithCanvas(_ values: NSSet)

    @objc(removeRelationWithCanvas:)
    @NSManaged public func removeFromRelationWithCanvas(_ values: NSSet)

}
