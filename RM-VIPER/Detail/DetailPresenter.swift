//
//  DetailPresenter.swift
//  Super easy dev
//
//  Created by Andrey on 09.09.2023
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadEpisodes(characterEpisodes: [Episode])
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol
    var interactor: DetailInteractorProtocol

    init(interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func didLoadEpisodes(characterEpisodes: [Episode]) {
        view?.showCharacterEpisodes(characterEpisodes: characterEpisodes)
    }
    
    func viewDidLoaded() {
        interactor.loadEpisodes()
        let character = interactor.getCharacterInfo()
        view?.showCharacterInfo(characterInfo: character)
    }
}
