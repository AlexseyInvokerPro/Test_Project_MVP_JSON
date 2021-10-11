//
//  CustomTableViewCell.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.font = .systemFont(ofSize: 14, weight: .bold)
        myLabel.numberOfLines = .zero
        
        return myLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        configureImage()
        configureLabel()
    }
    
    func configureImage() {
        contentView.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageView.widthAnchor.constraint(equalToConstant: 150),
            myImageView.heightAnchor.constraint(equalToConstant: 150),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            myImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20)
        ])
    }
    
    func configureLabel() {
        contentView.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            myLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 15),
            myLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            myLabel.widthAnchor.constraint(equalToConstant: 150),
            myLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

