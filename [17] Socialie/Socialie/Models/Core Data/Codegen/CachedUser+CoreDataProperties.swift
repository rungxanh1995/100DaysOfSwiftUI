//
//  CachedUser+CoreDataProperties.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

	
    @NSManaged public var cd_id: String?
    @NSManaged public var cd_name: String?
    @NSManaged public var cd_isActive: Bool
    @NSManaged public var cd_age: Int16
    @NSManaged public var cd_company: String?
    @NSManaged public var cd_email: String?
    @NSManaged public var cd_address: String?
    @NSManaged public var cd_about: String?
    @NSManaged public var cd_registered: Date?
    @NSManaged public var cd_tags: [String]?
    @NSManaged public var cd_friends: NSSet?

	// MARK: - Unwrapped properties
	var name: String { cd_name ?? "Unknown Name" }
	var isActive: Bool { cd_isActive }
	var age: Int { Int(cd_age) }
	var company: String { cd_company ?? "Unknown Company" }
	var email: String {cd_email ?? "unknown@email.com" }
	var address: String { cd_address ?? "Unknown Address" }
	var about: String { cd_about ?? "No About Information" }
	var registered: Date { cd_registered ?? Date.distantPast }
	var tags: [String] { cd_tags ?? [String]() }
	var friends: [CachedFriend] {
		let set = cd_friends as? Set<CachedFriend> ?? []
		return set.sorted { $0.name < $1.name }
	}
	var formattedRegisterDate: String {
		return registered.formatted(date: .abbreviated, time: .omitted)
	}
	
	var yearsAndMonthsSinceRegisteredUntilNow: String {
		let diffComponents = Calendar.current.dateComponents([.year, .month], from: registered, to: Date.now)
		let years = diffComponents.year
		let months = diffComponents.month
		return "\(years ?? 0)y \(months ?? 0)m"
	}
}

// MARK: Generated accessors for cd_friends
extension CachedUser {

    @objc(addCd_friendsObject:)
    @NSManaged public func addToCd_friends(_ value: CachedFriend)

    @objc(removeCd_friendsObject:)
    @NSManaged public func removeFromCd_friends(_ value: CachedFriend)

    @objc(addCd_friends:)
    @NSManaged public func addToCd_friends(_ values: NSSet)

    @objc(removeCd_friends:)
    @NSManaged public func removeFromCd_friends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
