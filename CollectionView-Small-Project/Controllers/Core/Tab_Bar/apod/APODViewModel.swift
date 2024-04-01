//
//  APODViewModel.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/30/24.
//

import UIKit

protocol APODViewModelDelegate: AnyObject {
	func didLoad()
}

final class APODViewModel: NSObject {
	
	public weak var delegate: APODViewModelDelegate?
	
	private var apodResult: [APODModel] = [] {
		didSet {
			for res in apodResult {
				let viewModel = APODCollectionViewCellViewModel(apodImageString: res.url,
																apodTitle: res.title,
																apodExplanation: res.explanation)
				cellViewModel.append(viewModel)
			}
		}
	}
	
	private var cellViewModel: [APODCollectionViewCellViewModel] = []
	
	func fetchAPOD() {
		let request = APIRequest(endpoint: .planetary, pathComponents: ["apod"])
		
		APIService.shared.execute(request, expecting: APODModel.self) { [weak self] result in
			switch result {
			case .success(let model):
				self?.apodResult.append(model)
				DispatchQueue.main.async {
					self?.delegate?.didLoad()
				}
				
			case .failure(let error):
				print(error)
			}
		}
	}
}

extension APODViewModel: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellViewModel.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: APODCollectionViewCell.cellIdentifier, for: indexPath) as! APODCollectionViewCell
		
		let viewModel = cellViewModel[indexPath.row]
		cell.configure(viewModel: viewModel)
		
		return cell
	}
}

extension APODViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
	}
}
