//
//  Movie+CoreDataProperties.swift
//  Technical CoreData
//
//  Created by Joe Pham on 2022-08-26.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

	public var wrappedTitle: String {
		title ?? "Unknown Title"
	}
}

extension Movie : Identifiable {

}
