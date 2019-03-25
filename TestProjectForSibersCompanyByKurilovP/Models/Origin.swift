//
//  Origin.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Origin: Codable {
    
    // MARK: - Properties
    let name: String?
    let url: String?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
