//
//  OriginTableViewCell.swift
//  RickAndMorty
//
//  Created by Andrey on 19.08.2023.
//

import UIKit

class OriginTableViewCell: UITableViewCell {
    
    static let identifier = "OriginTableViewCell"
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 12
        backView.backgroundColor = UIColor(named: "cellsBackgroundColor")
        backView.clipsToBounds = true
        return backView
    }()
    
    private lazy var planetBackView: UIView = {
        let planetBackView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 64, height: 64)))
        planetBackView.translatesAutoresizingMaskIntoConstraints = false
        planetBackView.layer.cornerRadius = 12
        planetBackView.backgroundColor = UIColor(named: "planetBackground")
        planetBackView.clipsToBounds = true
        return planetBackView
    }()
    
    private lazy var planetImage: UIImageView = {
        let planetImage = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetImage.image = UIImage(named: "planet")
        planetImage.contentMode = .scaleToFill
        return planetImage
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView(arrangedSubviews: [planetName, originType])
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.axis = .vertical
        return generalStackView
    }()
    
    private lazy var planetName: UILabel = {
        let planetName = UILabel()
        planetName.text = "Earth:"
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetName.textAlignment = .left
        return planetName
    }()
    
    private lazy var originType: UILabel = {
        let originType = UILabel()
        originType.text = "Planet"
        originType.translatesAutoresizingMaskIntoConstraints = false
        originType.textAlignment = .left
        originType.textColor = .green
        return originType
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
        backView.addSubview(planetBackView)
        backView.addSubview(generalStackView)
        planetBackView.addSubview(planetImage)
        setupConstraints()
    }
    
    func configureOrigin(model: Result) {
        
//        if let url = URL(string: model.origin.url) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//              // Error handling...
//              guard let imageData = data else { return }
//
//              DispatchQueue.main.async {
//                  self.planetImage.image = UIImage(data: imageData)
//              }
//            }.resume()
//          }
        
        planetName.text = model.origin.name
        originType.text = model.origin.url
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            planetBackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8),
            planetBackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            planetBackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8),
            planetBackView.widthAnchor.constraint(equalToConstant: 64),
            planetBackView.heightAnchor.constraint(equalToConstant: 64),
            
            
            planetImage.centerYAnchor.constraint(equalTo: planetBackView.centerYAnchor),
            planetImage.centerXAnchor.constraint(equalTo: planetBackView.centerXAnchor),
            
            generalStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            generalStackView.leadingAnchor.constraint(equalTo: planetBackView.trailingAnchor, constant: 16),
            generalStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            generalStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
        
        ])
    }

}

