//
//  CharacterDetailTableViewCell.swift
//  RickAndMorty
//
//  Created by Andrey on 20.08.2023.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterDetailTableViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [characterName, characterState])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.setCustomSpacing(24, after: characterImage)
        stackView.setCustomSpacing(8, after: characterName)
        return stackView
    }()
    
    private lazy var characterImage: CachedImageView = {
        let characterImage = CachedImageView()
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.layer.cornerRadius = 16
        characterImage.backgroundColor = .blue
        characterImage.contentMode = .scaleToFill
        characterImage.clipsToBounds = true
        return characterImage
    }()
    
    private lazy var characterName: UILabel = {
        let characterName = UILabel()
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.text = "Rick Sanchez"
        characterName.font = .systemFont(ofSize: 22)
        characterName.textColor = .white
        characterName.textAlignment = .center
        return characterName
    }()
    
    private lazy var characterState: UILabel = {
        let characterState = UILabel()
        characterState.translatesAutoresizingMaskIntoConstraints = false
        characterState.text = "Alive"
        characterState.textColor = .systemGreen
        characterState.font = .systemFont(ofSize: 16)
        characterState.textAlignment = .center
        return characterState
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(named: "backgroundColor")
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        setupConstraints()
    }
    
    func configureCharacter(model: Result) {
        characterImage.loadImage(urlString: model.image)
        characterName.text = model.name
        characterState.text = model.status.rawValue
    }
    
    
    
    private func setupConstraints() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        contentView.addSubview(characterState)
        NSLayoutConstraint.activate([
            
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.39),
            characterImage.heightAnchor.constraint(equalToConstant: contentView.frame.width * 0.39),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 24),
            characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            characterState.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
            characterState.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterState.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterState.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        
        ])
    }

}
