//
//  CustomHeader.swift
//  RickAndMorty
//
//  Created by Andrey on 19.08.2023.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    static let identifier = "CustomHeader"
    
    private lazy var labelHeader: UILabel = {
        let labelHeader = UILabel()
        labelHeader.translatesAutoresizingMaskIntoConstraints = false
        labelHeader.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        labelHeader.textColor = .white
        return labelHeader
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTile(title: String) {
        labelHeader.text = title
    }
    
    private func configureHeader() {
        contentView.addSubview(labelHeader)
        
        NSLayoutConstraint.activate([
            labelHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            labelHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelHeader.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}

