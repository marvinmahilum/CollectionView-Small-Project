//
//  MarsRoverPhotosView.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import UIKit

final class MarsRoverPhotosView: UIView {
	
	private let viewModel = MarsRoverPhotosViewModel()
	
	private let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumInteritemSpacing = 0
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(MarsRoverPhotosCollectionViewCell.self, forCellWithReuseIdentifier: MarsRoverPhotosCollectionViewCell.cellIdentifier)
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubviews(collectionView)
		addConstraints()
		viewModel.delegate = self
		viewModel.fetchMarsRoverPhotos()
		collectionView.dataSource = viewModel
		collectionView.delegate = viewModel
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
		])
	}
}

extension MarsRoverPhotosView: MarsRoverPhotosViewModelDelegate {
	func didLoad() {
		collectionView.reloadData()
	}
	
	
}
