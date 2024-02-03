//
//  CharacterCell.swift
//  RM-VIPER
//
//  Created by Andrey on 08.09.2023.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    static let identifier = "CharactersCell"
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor(named: "cellsBackgroundColor")
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 16
        
        return backView
    }()
    
    private lazy var characterImage: CachedImageView = {
        let characterImage = CachedImageView()
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.layer.cornerRadius = 10
        characterImage.contentMode = .scaleToFill
        characterImage.clipsToBounds = true
        return characterImage
    }()
    
    private lazy var characterName: UILabel = {
        let characterName = UILabel()
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.adjustsFontSizeToFitWidth = true
        characterName.numberOfLines = 2
        characterName.font = UIFont.systemFont(ofSize: 15)
        characterName.minimumScaleFactor = 0.2
        characterName.adjustsFontSizeToFitWidth = true
        characterName.textColor = .white
        characterName.textAlignment = .center
        return characterName
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(imageURL: String, name: String) {
        characterImage.loadImage(urlString: imageURL)
        characterName.text = name
    }
    
    private func configureUI() {
        contentView.addSubview(backView)
        backView.addSubview(characterImage)
        backView.addSubview(characterName)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            characterImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8),
            characterImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            characterImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            characterImage.bottomAnchor.constraint(equalTo: characterName.topAnchor, constant: -16),
            
            characterName.topAnchor.constraint(lessThanOrEqualTo: characterImage.bottomAnchor, constant: 16),
            characterName.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            characterName.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            characterName.bottomAnchor.constraint(lessThanOrEqualTo: backView.bottomAnchor, constant: -16),
            
        ])
    }
}

