//
//  DetailInteractor.swift
//  Super easy dev
//
//  Created by Andrey on 09.09.2023
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    func getCharacterInfo() -> Result
    func loadEpisodes()
}

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    let character: Result
    var characterEpisodes: [Episode] = []
    var episodesURLS: [URL] = []
    
    init(characterInfo: Result) {
        self.character = characterInfo
    }
}

extension DetailInteractor {
    
    private func convertString() -> [URL] {
        return character.episode.compactMap({URL(string: $0)})
    }
    
    func getCharacterInfo() -> Result {
        return self.character
    }
    
    func loadEpisodes() {
        episodesURLS = convertString()
        ApiManager.shared.getEpisodes(episodesURLS: episodesURLS) { [ weak self ] episodes in
            self?.presenter?.didLoadEpisodes(characterEpisodes: episodes)
            self?.characterEpisodes = episodes
        }
    }
}
