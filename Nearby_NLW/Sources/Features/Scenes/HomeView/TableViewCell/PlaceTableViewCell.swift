//
//  PlaceTableViewCell.swift
//  Nearby_NLW
//
//  Created by Lucas Rosa  on 12/12/24.
//

import Foundation
import UIKit


class PlaceTableViewCell: UITableViewCell {
    static let identifier = "PlaceTableCell" //! A table view precisa de um identificador da celula para mostrar
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = Typography.titleSM
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descritionLabel: UILabel = {
        let label = UILabel()
        
        label.font = Typography.textSM
        label.numberOfLines = 0
        label.textColor = Colors.gray300
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let ticketIcon: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "ticket")
        imageView.tintColor = Colors.redBase
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let ticketLabel: UILabel = {
        let label = UILabel()
        
        label.font = Typography.textXS
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.gray200.c
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        addSubview(containerView)
        containerView.addSubview(itemImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descritionLabel)
        containerView.addSubview(ticketIcon)
        containerView.addSubview(ticketLabel)
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        //contentView = self
        NSLayoutConstraint.activate([
            // container view -> Vai guardar uos elementos como se fosse uma tela
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            itemImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            descritionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descritionLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            descritionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            ticketIcon.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            ticketIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            ticketIcon.widthAnchor.constraint(equalToConstant: 13),
            ticketIcon.heightAnchor.constraint(equalToConstant: 11),
            
            ticketLabel.centerYAnchor.constraint(equalTo: ticketIcon.centerYAnchor),
            ticketIcon.leadingAnchor.constraint(equalTo: ticketIcon.trailingAnchor, constant: 4)
            
        ])
        
    }
    
    func configure(with place: Place){
        itemImage.image = UIImage(named: place.imageName)
        titleLabel.text = place.title
        descritionLabel.text = place.description
        ticketLabel.text = "cupons disponíveis"
    }
}
