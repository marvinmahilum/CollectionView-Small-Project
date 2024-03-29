//
//  UIView+.swift
//  CollectionView-Small-Project
//
//  Created by CoreProc on 3/29/24.
//

import UIKit

extension UIView {
	func addSubviews(_ views: UIView...) {
		views.forEach({
			addSubview($0)
		})
	}
}
