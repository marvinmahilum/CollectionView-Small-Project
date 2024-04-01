//
//  MarsRoverPhotosViewModel.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import UIKit

protocol MarsRoverPhotosViewModelDelegate: AnyObject {
	func didLoad()
}

final class MarsRoverPhotosViewModel: NSObject {
	
	public weak var delegate: MarsRoverPhotosViewModelDelegate?
	
	private var marsRoverPhotosResult: [PhotoModel] = [] {
		didSet {
			for photo in marsRoverPhotosResult {
				let viewModel = MarsRoverPhotosCollectionViewCellViewModel(id: photo.id,
																		   imageString: photo.imgSrc)
				cellViewModel.append(viewModel)
			}
		}
	}
	
	private var cellViewModel: [MarsRoverPhotosCollectionViewCellViewModel] = []
	
	func fetchMarsRoverPhotos() {
		let request = APIRequest(endpoint: .marsPhotos,
								 pathComponents: ["api", "v1", "rovers", "curiosity", "photos"],
								 queryParameters: [
									URLQueryItem(name: "sol", value: "1000"),
									URLQueryItem(name: "page", value: "1"),
								 ])
		
		APIService.shared.execute(request, expecting: GetMarsRoverPhotosResponse.self) { [weak self] result in
			switch result {
			case .success(let model):
				self?.marsRoverPhotosResult = model.photos
				DispatchQueue.main.async {
					self?.delegate?.didLoad()
				}
				
			case .failure(let error):
				print(error)
			}
		}
	}
}

extension MarsRoverPhotosViewModel: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellViewModel.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarsRoverPhotosCollectionViewCell.cellIdentifier, for: indexPath) as! MarsRoverPhotosCollectionViewCell
		
		let viewModel = cellViewModel[indexPath.row]
		cell.configure(viewModel: viewModel)
		
		return cell
	}
}

extension MarsRoverPhotosViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let cellWidthSize = collectionView.bounds.width / 2
		
		return CGSize(width: cellWidthSize - 5, height: cellWidthSize)
	}
}
