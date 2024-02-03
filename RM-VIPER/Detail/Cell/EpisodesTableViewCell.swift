//
//  EpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Andrey on 20.08.2023.


import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    static let identifier = "EpisodesTableViewCell"
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 12
        backView.backgroundColor = UIColor(named: "cellsBackgroundColor")
        backView.clipsToBounds = true
        return backView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView(arrangedSubviews: [episodeName, episodeNumber])
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.axis = .vertical
        generalStackView.spacing = 16
        generalStackView.distribution = .fillEqually
        return generalStackView
    }()
    
    private lazy var episodeName: UILabel = {
        let episodeName = UILabel()
        episodeName.translatesAutoresizingMaskIntoConstraints = false
        episodeName.font = UIFont.systemFont(ofSize: 17)
        episodeName.textAlignment = .left
        return episodeName
    }()
    
    private lazy var episodeNumber: UILabel = {
        let episodeNumber = UILabel()
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.font = UIFont.systemFont(ofSize: 13)
        episodeNumber.textAlignment = .left
        episodeNumber.textColor = .green
        return episodeNumber
    }()
    
    private lazy var releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.font = UIFont.systemFont(ofSize: 12)
        releaseDate.textAlignment = .right
        releaseDate.textColor = .lightGray
        return releaseDate
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
        contentView.addSubview(backView)
        backView.addSubview(generalStackView)
        backView.addSubview(releaseDate)
        setupConstraints()
    }
    
    func configureEpisodes(model: Episode) {        
        episodeName.text = model.name
        episodeNumber.text = model.episode
        releaseDate.text = model.air_date
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            generalStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            generalStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            generalStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
        
            releaseDate.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            releaseDate.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            releaseDate.leadingAnchor.constraint(lessThanOrEqualTo: backView.trailingAnchor),
        ])
    }
}

