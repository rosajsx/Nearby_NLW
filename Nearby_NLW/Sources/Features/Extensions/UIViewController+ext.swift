//
//  UIViewController+ext.swift
//  Nearby_NLW
//
//  Created by Lucas Rosa  on 11/12/24.
//

import Foundation
import UIKit


extension UIViewController {
    public func setupContentViewToViewController(contentView: UIView){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // top
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // left
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // right
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // bottom
        ])
    }
}
