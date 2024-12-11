//
//  SplashViewController.swift
//  NearbyApp NLW
//
//  Created by Lucas Rosa on 12/12/24.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    
    init(contentView: SplashView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.greenLight
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor), // top
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // left
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // right
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // bottom
        ])
    }
}
