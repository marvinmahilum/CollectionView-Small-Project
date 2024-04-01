//
//  MarsRoverPhotosCollectionViewCellViewModel.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import Foundation

final class MarsRoverPhotosCollectionViewCellViewModel {
	
	let id: Int
	let imageString: String
	
	// MARK: - Init
	
	init(id: Int, imageString: String) {
		self.id = id
		self.imageString = imageString
	}
	
}
