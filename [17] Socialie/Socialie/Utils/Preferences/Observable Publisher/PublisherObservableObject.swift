//
//  PublisherObservableObject.swift
//  Socialie
//
//  Created by Joe Pham on 2022-09-02.
//	Code by Antoine van der Lee
//	Link: https://www.avanderlee.com/swift/appstorage-explained/?utm_campaign=coschedule&utm_source=twitter&utm_medium=twannl&utm_content=%40AppStorage%20explained%20and%20replicated%20for%20a%20better%20alternative
//

import Combine

final class PublisherObservableObject: ObservableObject {
	var subscriber: AnyCancellable?
	
	init(publisher: AnyPublisher<Void, Never>) {
		subscriber = publisher.sink(receiveValue: { [weak self] _ in
			self?.objectWillChange.send()
		})
	}
}
