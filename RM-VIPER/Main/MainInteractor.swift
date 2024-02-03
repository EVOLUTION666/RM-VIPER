//
//  MainInteractor.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func loadCharacters()
    var characters: [Result] { get }
}

class MainInteractor: MainInteractorProtocol {
    var characters: [Result] = []
    
    weak var presenter: MainPresenterProtocol?
    
    func loadCharacters() {
        ApiManager.shared.getCharacters { [weak self] characters in
            self?.presenter?.didLoad(characters: characters)
            self?.characters = characters
        }
    }
}
