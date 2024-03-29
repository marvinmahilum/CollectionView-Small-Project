//
//  APIRequest.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import Foundation

/// Obect that represents a single API call
final class APIRequest {
	
	/// API Constants
	private struct Constants {
		static let baseUrl = "https://api.nasa.gov"
		static let apiKey = "zChgiXdObTMHJabRygPO47q72r5tsVKtKWVIfo40"
	}
	
	/// Desired endpoint
	private let endpoint: APIEndpoint
	
	/// Path components for API, if any
	private let pathComponents: [String]
	
	/// Query arguments for API, if any
	private var queryParameters: [URLQueryItem]
	
	/// Constructed url for the api request in string format
	private var urlString: String {
		var string = Constants.baseUrl
		string += "/"
		string += endpoint.rawValue
		
		if !pathComponents.isEmpty {
			pathComponents.forEach({
				string += "/\($0)"
			})
		}
		
		queryParameters.append(URLQueryItem(name: "api_key", value: Constants.apiKey))
		
		if !queryParameters.isEmpty {
			string += "?"
			let argumentString = queryParameters.compactMap({
				guard let value = $0.value else { return nil }
				return "\($0.name)=\(value)"
			}).joined(separator: "&")
			
			string += argumentString
		}
		
		return string
	}
	
	/// Computed & constructed API url
	public var url: URL? {
		print("urlRequest: \(urlString)")
		return URL(string: urlString)
	}
	
	/// Desired http method
	public let httpMethod = "GET"
	
	// MARK: - Public
	
	/// Construct request
	/// - Parameters:
	///   - endpoint: Target endpoint
	///   - pathComponents: Collection of Path Components
	///   - queryParameters: Collection of Query parameters
	public init(endpoint: APIEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
		self.endpoint = endpoint
		self.pathComponents = pathComponents
		self.queryParameters = queryParameters
	}
	
}
