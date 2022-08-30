//
//  Country+CoreDataProperties.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?

	public var wrappedShortName: String {
		shortName ?? "Unknown Country"
	}
	
	public var wrappedFullName: String {
		fullName ?? "Unknown Country"
	}
	
	/// Array so that `ForEach` can read individual values
	public var candyArray: [CandyBar] {
		let set = candy as? Set<CandyBar> ?? []
		return set.sorted {
			$0.wrappedName < $1.wrappedName
		}
	}
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: CandyBar)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: CandyBar)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
