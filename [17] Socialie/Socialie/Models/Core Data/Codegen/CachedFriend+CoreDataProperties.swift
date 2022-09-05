//
//  CachedFriend+CoreDataProperties.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

	// Naming Convention: `cd_` short for `Core Data`
    @NSManaged public var cd_id: String?
    @NSManaged public var cd_name: String?
    @NSManaged public var cd_user: CachedUser?

	// MARK: - Unwrapped properties
	var name: String { cd_name ?? "Unknown Name" }
}

extension CachedFriend : Identifiable {

}
