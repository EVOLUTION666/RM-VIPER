//
//  DetailsTableViewCell.swift
//  RickAndMorty
//
//  Created by Andrey on 19.08.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let identifier = "InfoTableViewCell"
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 16
        backView.backgroundColor = UIColor(named: "cellsBackgroundColor")
        backView.clipsToBounds = true
        return backView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView(arrangedSubviews: [speciesStackView, typeStackView, genderStackView])
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.axis = .vertical
        generalStackView.spacing = 16
        generalStackView.distribution = .fillEqually
        return generalStackView
    }()

    private lazy var speciesStackView: UIStackView = {
        let speciesStackView = UIStackView(arrangedSubviews: [speciesTitle, species])
        speciesStackView.translatesAutoresizingMaskIntoConstraints = false
        speciesStackView.axis = .horizontal
        return speciesStackView
    }()

    private lazy var typeStackView: UIStackView = {
        let typeStackView = UIStackView(arrangedSubviews: [typeTitle, type])
        typeStackView.translatesAutoresizingMaskIntoConstraints = false
        typeStackView.axis = .horizontal
        return typeStackView
    }()

    private lazy var genderStackView: UIStackView = {
        let genderStackView = UIStackView(arrangedSubviews: [genderTitle, gender])
        genderStackView.translatesAutoresizingMaskIntoConstraints = false
        genderStackView.axis = .horizontal
        return genderStackView
    }()

    private lazy var speciesTitle: UILabel = {
        let speciesTitle = UILabel()
        speciesTitle.text = "Species:"
        speciesTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 500))
        speciesTitle.textAlignment = .left
        speciesTitle.translatesAutoresizingMaskIntoConstraints = false
        return speciesTitle
    }()

    private lazy var species: UILabel = {
        let species = UILabel()
        species.font = UIFont.systemFont(ofSize: 20)
        species.translatesAutoresizingMaskIntoConstraints = false
        species.textAlignment = .right
        return species
    }()

    private lazy var typeTitle: UILabel = {
        let typeTitle = UILabel()
        typeTitle.translatesAutoresizingMaskIntoConstraints = false
        typeTitle.textAlignment = .left
        typeTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 500))
        typeTitle.text = "Type:"
        return typeTitle
    }()

    private lazy var type: UILabel = {
        let type = UILabel()
        type.font = UIFont.systemFont(ofSize: 20)
        type.textAlignment = .right
        type.translatesAutoresizingMaskIntoConstraints = false
        return type
    }()

    private lazy var genderTitle: UILabel = {
        let genderTitle = UILabel()
        genderTitle.translatesAutoresizingMaskIntoConstraints = false
        genderTitle.textAlignment = .left
        genderTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 500))
        genderTitle.text = "Gender:"
        return genderTitle
    }()

    private lazy var gender: UILabel = {
        let gender = UILabel()
        gender.font = UIFont.systemFont(ofSize: 20)
        gender.textAlignment = .right
        gender.translatesAutoresizingMaskIntoConstraints = false
        return gender
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupUI() {
        contentView.addSubview(backView)
        contentView.backgroundColor = UIColor(named: "backgroundColor")
        backView.addSubview(generalStackView)
        setupConstraints()
    }
    
    func configureInfo(model: Result) {
        species.text = model.species.rawValue
        type.text = model.type
        gender.text = model.gender.rawValue
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            generalStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            generalStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            generalStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            generalStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
        
        ])
    }

}
