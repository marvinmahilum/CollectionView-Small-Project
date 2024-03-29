//
//  ApiJSONEncoder.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import Foundation

class ApiJSONEncoder: JSONEncoder {
	
	static let shared = ApiJSONEncoder()
	
	override init() {
		super.init()
		self.keyEncodingStrategy = .convertToSnakeCase
	}
	
}
