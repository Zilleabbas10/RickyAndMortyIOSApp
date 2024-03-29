//
//  Extensions.swift
//  RickyAndMorty
//
//  Created by Zill-e-Abbas on 14.01.24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
