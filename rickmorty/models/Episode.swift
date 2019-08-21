//
//  Episode.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

struct Episode: Codable {
    var ide: Int
    var namee: String
    var airDate: String
    var episodeCode: String
    var characters: [String]
    var url: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case ide = "id"
        case namee = "name"
        case airDate = "air_date"
        case episodeCode = "episode"
        case characters
        case url
        case created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ide = try container.decode(Int.self, forKey: .ide)
        namee = try container.decode(String.self, forKey: .namee)
        airDate = try container.decode(String.self, forKey: .airDate)
        episodeCode = try container.decode(String.self, forKey: .episodeCode)
        characters = try container.decode([String].self, forKey: .characters)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
}
