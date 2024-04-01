//
//  MarsRoverPhotosCollectionViewCell.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 4/1/24.
//

import UIKit

class MarsRoverPhotosCollectionViewCell: UICollectionViewCell {
	static let cellIdentifier = "MarsRoverPhotosCollectionViewCell"
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = .secondarySystemBackground
		contentView.addSubviews(imageView)
		addConstrats()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imageView.image = nil
	}
	
	private func addConstrats(){
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
	}
	
	public func configure(viewModel: MarsRoverPhotosCollectionViewCellViewModel) {
		imageView.kf.setImage(with: URL(string: viewModel.imageString))
	}
}
