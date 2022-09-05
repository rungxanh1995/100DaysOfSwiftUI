//
//  HomeVMTests.swift
//  SocialieTests
//
//  Created by Joe Pham on 2022-09-05.
//

import XCTest
@testable import Socialie

final class HomeVMTests: XCTestCase {
	
	var vm: HomeView.ViewModel!
	var mockDataCoord: MockDataCoordinator!
	
	override func setUp() {
		mockDataCoord = .init()
		vm = .init(dataCoordinator: mockDataCoord)
	}
	
	func testDataFetchingOperationsShouldPass() async -> Void {
		await vm.fetchData()
	}
}
