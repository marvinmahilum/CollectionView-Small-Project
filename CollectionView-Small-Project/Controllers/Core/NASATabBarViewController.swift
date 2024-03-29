//
//  ViewController.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import UIKit

final class NASATabBarViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTabs()
	}
	
	private func setUpTabs() {
		let apodVC = APODViewController()
		let marsRoverPhotosVC = MarsRoverPhotosViewController()
		
		let nav1 = UINavigationController(rootViewController: apodVC)
		let nav2 = UINavigationController(rootViewController: marsRoverPhotosVC)
		
		nav1.tabBarItem = UITabBarItem(title: "Astronomy Picture of The Day", image: UIImage(systemName: "globe.asia.australia"), tag: 1)
		nav2.tabBarItem = UITabBarItem(title: "Mars Rover Photos", image: UIImage(systemName: "photo"), tag: 2)
		
		setViewControllers(
			[nav1,nav2],
			animated: true
		)
		
	}

}

