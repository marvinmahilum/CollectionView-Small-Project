//
//  APODView.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/30/24.
//

import UIKit

final class APODView: UIView {
	
	private let viewModel = APODViewModel()
	
	private let apodCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(APODCollectionViewCell.self, forCellWithReuseIdentifier: APODCollectionViewCell.cellIdentifier)
		return collectionView
	}()
	
	// MARK: - init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubviews(apodCollectionView)
		addConstraints()
		viewModel.delegate = self
		viewModel.fetchAPOD()
		apodCollectionView.dataSource = viewModel
		apodCollectionView.delegate = viewModel
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addConstraints() {
		NSLayoutConstraint.activate([
			apodCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			apodCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			apodCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
			apodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
		])
	}
}

extension APODView: APODViewModelDelegate {
	func didLoad() {
		apodCollectionView.reloadData()
	}
}
