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
	
	enum APIServiceError: Error {
		case failedToCreateRequest
		case failedToGetData
	}
	
	/// Send API Call
	/// - Parameters:
	///   - request: Request instance
	///   - type: The type of object we expect to get back
	///   - completion: Callback with data or error
	public func execute<T: Codable>(
		_ request: APIRequest,
		expecting type: T.Type,
		completion: @escaping (Result<T, Error>) -> Void
	) {
		guard let urlRequest = self.request(from: request) else {
			completion(.failure(APIServiceError.failedToCreateRequest))
			return
		}
		
		let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
			guard let data = data, error == nil else {
				completion(.failure(error ?? APIServiceError.failedToGetData))
				return
			}
			
			// Decode response
			do {
				let result = try JSONDecoder().decode(type.self, from: data)
				completion(.success(result))
			}
			catch {
				completion(.failure(error))
			}
		}
		task.resume()
	}
	
	// MARK: - Private
	
	private func request(from apiRequest: APIRequest) -> URLRequest? {
		guard let url = apiRequest.url else { return nil }
		var request = URLRequest(url: url)
		request.httpMethod = apiRequest.httpMethod
		return request
	}
	
}
