//
//  MainPresenter.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didLoad(characters: [Result]?)
    func didSelectItemAt(indexPath: IndexPath)
}

class MainPresenter {
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    
    init(router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainPresenter: MainPresenterProtocol {
    func didSelectItemAt(indexPath: IndexPath) {
        let character = interactor.characters[indexPath.row]
        router.openCharacterDetail(for: character)
    }
    
    func didLoad(characters: [Result]?) {
        view?.showCharacters(characters: characters!)
    }
    
    func viewDidLoad() {
        interactor.loadCharacters()
    }
}
