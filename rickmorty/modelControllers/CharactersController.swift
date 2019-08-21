//
//  CharactersController.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

class CharactersController {
    func fetchMultipleCharacters(url: String? = nil, queries: [String: String]? = nil, completion: @escaping (PagedInfo<Character>?) -> Void) {
        
        var validUrl: URL?
        var baseURL = URL(string: "https://rickandmortyapi.com/api/character/")!
        
        if let url = url {
            validUrl = URL(string: url)
        }
        else {
            validUrl = baseURL
        }
        
        if let queries = queries {
            baseURL = baseURL.withQueries(queries)!
        }
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: validUrl!) { (data, response, error) in
            if let data = data, let pagedData = try? jsonDecoder.decode(PagedInfo<Character>.self, from: data) {
              
                //print("\(character.results)")
                completion(pagedData)
            }
            else {
                print("Could not decode")
                completion(nil)
            }
        }
        task.resume()
    }
}
