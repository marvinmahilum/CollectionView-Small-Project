//
//  APODCollectionViewCell.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/30/24.
//

import UIKit
import Kingfisher

final class APODCollectionViewCell: UICollectionViewCell {
	static let cellIdentifier = "APODCollectionViewCell"
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
		label.font = .systemFont(ofSize: 18, weight: .bold)
		label.numberOfLines = 0
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let explanationTextView: UITextView = {
		let textView = UITextView()
		textView.textColor = .secondaryLabel
		textView.font = .systemFont(ofSize: 16, weight: .regular)
		textView.isEditable = false
		textView.backgroundColor = .clear
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	
	// MARK: - init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = .secondarySystemBackground
		contentView.addSubviews(imageView, titleLabel, explanationTextView)
		addConstrats()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imageView.image = nil
		titleLabel.text = nil
		explanationTextView.text = nil
	}
	
	private func addConstrats(){
		NSLayoutConstraint.activate([
			
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10),
			
			titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: explanationTextView.topAnchor, constant: -10),
			
			explanationTextView.heightAnchor.constraint(equalToConstant: contentView.frame.size.height / 2.5),
			explanationTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			explanationTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			explanationTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
	
	public func configure(viewModel: APODCollectionViewCellViewModel) {
		imageView.kf.setImage(with: URL(string: viewModel.apodImageString))
		titleLabel.text = viewModel.apodTitle
		explanationTextView.text = viewModel.apodExplanation
	}
	
}
