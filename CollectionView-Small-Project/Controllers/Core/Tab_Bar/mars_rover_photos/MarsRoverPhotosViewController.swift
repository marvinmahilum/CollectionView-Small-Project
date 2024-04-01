//
//  MarsRoverPhotosViewController.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import UIKit

/// Controller to show the Mars Rover Photos
final class MarsRoverPhotosViewController: UIViewController {
	
	private let marsRoverPhotosView = MarsRoverPhotosView()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		title = "Mars Rover Photos"
		
		view.addSubviews(marsRoverPhotosView)
		addConstraints()
		
    }
	
	private func addConstraints() {
		NSLayoutConstraint.activate([
			marsRoverPhotosView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			marsRoverPhotosView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			marsRoverPhotosView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			marsRoverPhotosView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

}
