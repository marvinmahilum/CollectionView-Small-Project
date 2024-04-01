//
//  Config.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import Foundation

struct Config: Decodable {
	
	static var shared: Config = {
		let infoPlist = Bundle.main.infoDictionary!
		let jsonData = try! JSONSerialization.data(withJSONObject: infoPlist, options: .prettyPrinted)
		return try! JSONDecoder().decode(Config.self, from: jsonData)
	}()
	
	var baseURL: URL
	var apiKey: String

	enum CodingKeys: String, CodingKey {
		case baseURL = "API_BASE_URL"
		case apiKey = "API_KEY"

	}
	
}

extension Config {
	
	func showInfo() {
		let linesToPrint = [
			"APPINFO:",
			"Base URL: \(baseURL.absoluteString)",
		
		]
		let longestLineLength = (linesToPrint.map { return $0.count }).max() ?? 0
		
		let topBorder = String(repeating: "*", count: longestLineLength + 4)
		let bottomBorder = topBorder
		print(topBorder)
		linesToPrint.forEach { printWithPadding($0, longestLineCount: longestLineLength) }
		print(bottomBorder)
	}
	
	private func printWithPadding(_ line: String, longestLineCount: Int) {
		print("* \(line)\(String(repeating: " ", count: longestLineCount - line.count)) *")
	}
	
}
