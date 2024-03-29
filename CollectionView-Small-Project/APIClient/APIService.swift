//
//  APIService.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import Foundation

/// Primary API service object to get data
final class APIService {
	
	/// Shared singleton instance
	static let shared = APIService()
	
	/// Privatized constructor
	private init() {}
	
	/// Send API Call
	/// - Parameters:
	///   - request: Request instance
	///   - type: The type of object we expect to get back
	///   - completion: Callback with data or error
	public func execute<T: Codable>(_ request: APIRequest,
									expecting type: T.Type,
									completion: @escaping (Result<T, Error>) -> Void) {
		
	}
	
}
