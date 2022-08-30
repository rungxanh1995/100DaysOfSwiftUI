//
//  CandyBar+CoreDataProperties.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-29.
//
//

import Foundation
import CoreData


extension CandyBar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CandyBar> {
        return NSFetchRequest<CandyBar>(entityName: "CandyBar")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

	public var wrappedName: String {
		name ?? "Unknown Candybar"
	}
}

extension CandyBar : Identifiable {

}
