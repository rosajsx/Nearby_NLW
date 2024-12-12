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
    // let delegate: SplashFlowDelegate // Se declarado dessa forma, vamos sofrer do que chamamos de leak de memória
    weak var delegate: SplashFlowDelegate? // Variavel fraca para o contador de memória, dessa forma a classe não vai se persistir no app.
    
    init(contentView: SplashView, delegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        decideFlow()
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
    
    private func decideFlow(){
        //decidir se o usuário irá para home ou pra tela de dicas
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [ weak self ] in
            self?.delegate?.decideNavigationFlow()
        }
    }
}
