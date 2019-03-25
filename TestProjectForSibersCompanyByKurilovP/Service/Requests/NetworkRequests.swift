//
//  NetworkRequests.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

class NetworkRequests: NetworkManager {
    
    // MARK: - Properies
    let session: URLSession
    
    // MARK: - Init
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    // MARK: - API requests
    func getFeed(from requestType: RequestFeeds,
                 use characterName: String,
                 completion: @escaping (Result<Info?, NetworkManagerError>) -> Void) {
        let localRequest = requestType.requestCharactersByName(characterName)
        fetch(with: localRequest, decode: { json -> Info? in
            guard let weatherFeedResult = json as? Info else { return  nil }
            return weatherFeedResult
        }, completion: completion)
    }
    
    func getFeed(from requestType: RequestFeeds,
                 use characterName: String,
                 use page: Int,
                 completion: @escaping (Result<Info?, NetworkManagerError>) -> Void) {
        let localRequest = requestType.requestCharactersByNameAndByPage(characterName, page)
        fetch(with: localRequest, decode: { json -> Info? in
            guard let weatherFeedResult = json as? Info else { return  nil }
            return weatherFeedResult
        }, completion: completion)
    }
    
    func getFeedCharacter(from requestType: RequestFeeds,
                          use id: String,
                          completion: @escaping (Result<Character?, NetworkManagerError>) -> Void) {
        let localRequest = requestType.requestCharacterDetail(id)
        fetch(with: localRequest, decode: { json -> Character? in
            guard let weatherFeedResult = json as? Character else { return  nil }
            return weatherFeedResult
        }, completion: completion)
    }
}
