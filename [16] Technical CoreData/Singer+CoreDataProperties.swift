//
//  Singer+CoreDataProperties.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

	@NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

	public var wrappedFirstName: String {
		firstName ?? "Unknown"
	}
	
	public var wrappedLastName: String {
		lastName ?? "Unknown"
	}
}

extension Singer : Identifiable {

}
