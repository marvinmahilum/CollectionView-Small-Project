//
//  APODViewController.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import UIKit

/// Controller to show the Astronomy Picture of the Day
final class APODViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		title = "Astronomy Picture of The Day"
		
//		let request = APIRequest(endpoint: .marsPhotos,
//								 pathComponents: ["api", "v1", "rovers", "curiosity", "photos"], 
//								 queryParameters: [
//									URLQueryItem(name: "sol", value: "1000"),
//									URLQueryItem(name: "page", value: "1"),
//								 ])
		
		
		let request = APIRequest(endpoint: .planetary, pathComponents: ["apod"])
		
		APIService.shared.execute(request, expecting: APODModel.self) { result in
			switch result {
			case .success(let model):
				print(model.title)
			case .failure(let error):
				print(error)
			}
		}
		
    }
    
}
