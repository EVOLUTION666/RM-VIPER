//
//  CharacterService.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import UIKit

enum ApiType {
    case characters
    case locations
    case episodes
    
    var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    var path: String {
        switch self {
        case .characters: return "character"
        case .locations: return "location"
        case .episodes: return "episode"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        let request = URLRequest(url: url)
        return request
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func getCharacters(completion: @escaping ([Result]) -> Void) {
        let request = ApiType.characters.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let characters = try? JSONDecoder().decode(RMModel.self, from: data) {
                completion(characters.results)
            } else {
                completion([])
            }
        }
        task.resume()
        DispatchQueue.main.async {
            
        }
    }
    
    func getEpisodes(episodesURLS: [URL], completion: @escaping ([Episode]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var rmEpisodes = [Episode]()
        
        episodesURLS.forEach { [weak self] url in
            dispatchGroup.enter()
            self?.getEpisode(url: url) { episode in
                defer { dispatchGroup.leave() }
                guard let episode else { return }
                rmEpisodes.append(episode)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(rmEpisodes.sorted(by: { $0.id > $1.id }))
        }
    }
    
    private func getEpisode(url: URL, completion: @escaping (Episode?) -> Void) {
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let episode = try? JSONDecoder().decode(Episode.self, from: data) {
                completion(episode)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}


