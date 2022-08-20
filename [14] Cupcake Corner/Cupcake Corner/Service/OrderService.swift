//
//  OrderService.swift
//  Cupcake Corner
//
//  Created by Joe Pham on 2022-08-20.
//

import Foundation

protocol OrderService {
	func uploadAndReceive() async throws -> Order?
}

final class OrderServiceImpl: OrderService {
	private var order: Order
	private var request: URLRequest
	
	init(order: Order) {
		self.order = order
		self.request = Self.configNetworkRequest()
	}
	
	private static func configNetworkRequest() -> URLRequest {
		let url = URL(string: Constants.Api.baseUrl.appending(Constants.Api.endpoint))
		var request = URLRequest(url: url!)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		
		return request
	}
	
	/// Run a pre-configured network request,
	/// and process the response sent back from an API service
	func uploadAndReceive() async throws -> Order? {
		guard let encodedData = encodeOrderObject() else {
			return nil
		}
		
		let urlSession = URLSession.shared
		let (data, _) = try await urlSession.upload(for: self.request, from: encodedData)
		return try JSONDecoder().decode(Order.self, from: data)
	}
	
	private func encodeOrderObject() -> Data? {
		if let encoded = try? JSONEncoder().encode(self.order) {
			return encoded
		}
		
		print("Failed to encode order")
		return nil
	}
}
