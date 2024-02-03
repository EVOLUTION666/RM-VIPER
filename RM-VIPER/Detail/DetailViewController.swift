//
//  DetailViewController.swift
//  Super easy dev
//
//  Created by Andrey on 09.09.2023
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func showCharacterInfo(characterInfo: Result)
    func showCharacterEpisodes(characterEpisodes: [Episode])
}

class DetailViewController: UIViewController {
    
    // MARK: - Public
    var presenter: DetailPresenterProtocol?
    private var characterInfo: Result!
    private var characterEpisodes: [Episode] = []
    
    // MARK: - Private
    
    private var models = [DetailsModel]()
    
    deinit {
        print("DEBUG: deinit")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CharacterDetailTableViewCell.self,
                           forCellReuseIdentifier: CharacterDetailTableViewCell.identifier)
        tableView.register(InfoTableViewCell.self,
                           forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(OriginTableViewCell.self,
                           forCellReuseIdentifier: OriginTableViewCell.identifier)
        tableView.register(EpisodesTableViewCell.self,
                                   forCellReuseIdentifier: EpisodesTableViewCell.identifier)
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: CustomHeader.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0
        tableView.tableFooterView = nil
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        view.backgroundColor = UIColor(named: "backgroundColor")
        models = [.character, .info, .origin, .episodes]
        confiureUI()
    }
    
    @objc func didTapBackButton() {
        dismiss(animated: true)
        print("close")
    }
}

// MARK: - Private functions
private extension DetailViewController {
    
    func configureNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
    }


    
    func confiureUI() {
        view.addSubview(tableView)
        setupConstraints()
        configureNavBar()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),

        ])
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func showCharacterEpisodes(characterEpisodes: [Episode]) {
        self.characterEpisodes = characterEpisodes
        tableView.reloadData()
    }
    
    func showCharacterInfo(characterInfo: Result) {
        self.characterInfo = characterInfo
    }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .character:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailTableViewCell.identifier, for: indexPath) as! CharacterDetailTableViewCell
            cell.configureCharacter(model: characterInfo)
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell
            cell.configureInfo(model: characterInfo)
            return cell
        case .origin:
            let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.identifier, for: indexPath) as! OriginTableViewCell
            cell.configureOrigin(model: characterInfo)
            return cell
        case .episodes:
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier, for: indexPath) as! EpisodesTableViewCell
            cell.configureEpisodes(model: characterEpisodes[indexPath.row])
            return cell
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .character:
            return 1
        case .info:
            return 1
        case .origin:
            return 1
        case .episodes:
            return characterEpisodes.count
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            0
        }

        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return nil
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch models[indexPath.section] {
            case .character:
                return UITableView.automaticDimension
            case .info:
                return UITableView.automaticDimension
            case .origin:
                return UITableView.automaticDimension
            case .episodes:
                return UITableView.automaticDimension
            }
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                    CustomHeader.identifier) as! CustomHeader
            if section == 1 {
                header.setTile(title: "Info")
            } else if section == 2 {
                header.setTile(title: "Origin")
            } else if section == 3 {
                header.setTile(title: "Episodes")
            }
            return header
        }
    }
}
