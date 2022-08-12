//
//  ApiService.swift
//  Moonshot
//
//  Created by Joe Pham on 2022-08-11.
//

import Foundation

protocol ApiService {
	func fetchData<T: Decodable>(completion: @escaping (T) -> Void)
}
