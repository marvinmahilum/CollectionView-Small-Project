//
//  APODCollectionViewCellViewModel.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import Foundation

final class APODCollectionViewCellViewModel {
	
	let apodImageString: String
	let apodTitle: String
	let apodExplanation: String
	
	// MARK: - Init
	
	init(apodImageString: String ,apodTitle: String, apodExplanation: String) {
		self.apodImageString = apodImageString
		self.apodTitle = apodTitle
		self.apodExplanation = apodExplanation
	}
	
}
