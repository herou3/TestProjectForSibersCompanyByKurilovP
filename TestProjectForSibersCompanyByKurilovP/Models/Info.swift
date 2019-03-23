//
//  Info.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Info: Codable {
    
    // MARK: - Properties
    let count: Int?
    let pages: Int?
    let next: String?
    let previous: String?
    let characters: [Character]?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case characters = "results"
        case previous = "prev"
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        characters = try values.decodeIfPresent([Character].self, forKey: .characters)
    }
}

