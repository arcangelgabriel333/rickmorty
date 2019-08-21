//
//  EpisodesController.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

class EpisodesController {
    func fetchMultipleEpisodes(queries: [String: String]? = nil, completion: @escaping ([Episode]?) -> Void) {
        var baseURL = URL(string: "https://rickandmortyapi.com/api/episode/")!
        
        if let queries = queries {
            baseURL = baseURL.withQueries(queries)!
        }
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            if let data = data, let episode = try? jsonDecoder.decode(PagedInfo<Episode>.self, from: data) {
    
                //print(episode.results)
                completion(episode.results)
            }
            else {
                print("Could not decode")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchCharacterEpisodes(idList: [String], queries: [String: String]? = nil, completion: @escaping ([Episode]?) -> Void) {
        var baseURL = URL(string: "https://rickandmortyapi.com/api/episode/")!
        baseURL.appendPathComponent(idList.joined(separator: ","))
        
        if let queries = queries {
            baseURL = baseURL.withQueries(queries)!
        }
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            if let data = data, let episodes = try? jsonDecoder.decode([Episode].self, from: data) {
            
                completion(episodes)
            }
            else if let data = data, let episode = try?
                jsonDecoder.decode(Episode.self, from: data) {
                
                completion([episode])
            }
            else {
                print("Could not decode")
                completion(nil)
            }
        }
        task.resume()
    }
}
