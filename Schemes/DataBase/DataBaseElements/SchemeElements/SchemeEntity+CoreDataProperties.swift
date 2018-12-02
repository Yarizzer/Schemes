//
//  SchemeEntity+CoreDataProperties.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 08/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
//

import Foundation
import CoreData


extension SchemeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SchemeEntity> {
        return NSFetchRequest<SchemeEntity>(entityName: "SchemeEntity")
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var xPosition: Float
    @NSManaged public var yPosition: Float
    @NSManaged public var relationWithCanvas: CanvasEntity?

}
