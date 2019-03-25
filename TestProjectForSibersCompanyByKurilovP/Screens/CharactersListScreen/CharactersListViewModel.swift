//
//  CharactersListViewModel.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol CharactersListViewModelDelegate: class {
    // MARK: - Protocols methods
    func charactersListViewModel(_ viewModel: CharactersListViewModel, didSelectCharacter character: Character)
}

class CharactersListViewModel: CharactersListViewModelProtocol {
    
    // MARK: - Properies
    weak var delegate: CharactersListViewModelDelegate?
    private var info: Info?
    private var characters: [Character] = []
    private var updatedCharacters: [Character] = []
    private var searchingCharacters: [Character] = []
    private var curentPage: Int?
    private var selectedIndexPath: IndexPath?
    private let networRequests: NetworkRequests = NetworkRequests()
    var callAlertBlock: ((_ textTitle: String, _ textMessage: String) -> Void)?
    var requestUpdatedBlock: (() -> Void)?
    var startActivityIndicatorBlock: (() -> Void)?
    var completeActivityIndicatorBlock: (() -> Void)?
    
    // MARK: - Init
    init() { }
    
    // MARK: - Internal methods
    private func loadCharactersData(_ name: String, _ page: Int) {
        
        guard ReachabilityConnect.isConnectedToNetwork() else {
            callAlertBlock?("Oops, you have problem",
                            "The Internet connection appears to be offline") // Текста ошибок, по-хорошому, выносятся в файл локализации, но тут, я думаю, что не столь крритично это
            return
        }
        startActivityIndicatorBlock?()
        networRequests.getFeed(from: .character, use: name, use: page) { (result) in
            self.completeActivityIndicatorBlock?()
            switch result {
            case .success(let info):
                guard let networkInfo = info else { return }
                print(networkInfo)
                self.info = networkInfo
                self.requestUpdatedBlock?()
            case .failure(let error):
                self.completeActivityIndicatorBlock?()
                self.callAlertBlock?("Error", error.localizedDescription)
                print("This is \(error)")
            }
        }
    }
    
    // MARK: - Methods CharactersListViewModelProtocol
    func numberOfRows(inSection section: Int) -> Int {
        
        return info?.characters?.count ?? 0
    }
    
    func numberOfSections() -> Int {
        
        return 1
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CharactersListTableCellViewModelProtocol? {
        
        guard let characters = info?.characters else {
            return CharacterTableCellViewModel(character: Character(id: 0,
                                                                    name: "",
                                                                    status: "",
                                                                    species: "",
                                                                    type: "",
                                                                    gender: "",
                                                                    origin: Origin(name: "",
                                                                                   url: ""),
                                                                    location: Location(name: "",
                                                                                       url: ""),
                                                                    image: "",
                                                                    episodes: [],
                                                                    url: "",
                                                                    created: ""))
        }
        return CharacterTableCellViewModel(character: characters[indexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
        guard let characters = info?.characters else {
            return
        }
        self.completeActivityIndicatorBlock?()
        delegate?.charactersListViewModel(self, didSelectCharacter: characters[indexPath.row])
    }
    
    func titleForHeader(InSection section: Int) -> String {
        
        return "Characters"
    }
    
    func filterContentBySearchText(_ searchText: String) {
        self.loadCharactersData(searchText, curentPage ?? 1)
    }
}
