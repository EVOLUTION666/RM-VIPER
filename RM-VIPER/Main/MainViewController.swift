//
//  ViewController.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showCharacters(characters: [Result])
}

class MainViewController: UIViewController {
    
    // MARK: - Public
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - Private
    
    private var characters = [Result]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharactersCell.self,
                                forCellWithReuseIdentifier: CharactersCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

}

extension MainViewController: MainViewProtocol {
    func showCharacters(characters: [Result]) {
        DispatchQueue.main.async {
            self.characters = characters
            self.collectionView.reloadData()
        }
    }
}

private extension MainViewController {
    private func setupUI() {
        title = "Characters"
        view.backgroundColor = UIColor(named: "backgroundColor")
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as! CharactersCell
        cell.configureCell(imageURL: characters[indexPath.row].image, name: characters[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItemAt(indexPath: indexPath)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 48) / 2
        return CGSize(width: cellWidth, height: cellWidth * 1.294)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

