//
//  ApiJSONDecoder.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import Foundation

class ApiJSONDecoder: JSONDecoder {
	
	static let shared = ApiJSONDecoder()
	
	override init() {
		super.init()
		self.keyDecodingStrategy = .convertFromSnakeCase
	}
	
}
