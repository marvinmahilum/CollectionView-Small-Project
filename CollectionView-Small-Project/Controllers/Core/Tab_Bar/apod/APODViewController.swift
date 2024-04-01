//
//  APODViewController.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import UIKit

/// Controller to show the Astronomy Picture of the Day
final class APODViewController: UIViewController {
	
	private let apodView = APODView()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		title = "Astronomy Picture of The Day"
		
		view.addSubviews(apodView)
		addConstraints()
		
    }
	
	private func addConstraints() {
		NSLayoutConstraint.activate([
			apodView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			apodView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			apodView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			apodView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
    
}
