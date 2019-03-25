//
//  CharacterDetailViewModel.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

enum DefaultCellType {
    case nameCharacter, statusCharacter, speciesCharacter, typeCharacter, gendeCharacter, originLocationName, curentLocationName
    
    var description: String {
        switch self {
        case .nameCharacter:
            return "Name"
        case .statusCharacter:
            return "Status"
        case .speciesCharacter:
            return "Species"
        case .typeCharacter:
            return "Type"
        case .gendeCharacter:
            return "Gender"
        case .originLocationName:
            return "Origin location"
        case .curentLocationName:
            return "Curent location"
        }
    }
}

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    
    
    // MARK: - Properties
    private var character: Character?
    private var charactersListViewModels: [CharacterDetailTableCellViewModelProtocol] = []
    private let networRequests: NetworkRequests = NetworkRequests()
    var callAlertBlock: ((_ textTitle: String, _ textMessage: String) -> Void)?
    var requestUpdatedBlock: (() -> Void)?
    
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var originLocation: String?
    var curentLocation: String?
    var image: CachedImageView?
    
    var numberOfRows: Int? {
        return charactersListViewModels.count
    }
    
    // MARK: - init / deinit
    // При инициализации объекта, данные будут передаваться из общего списка персонажей,
    // а после, будут обновляться, при помощи отдельного запроса
    init(character: Character?) {
        self.character = character
        self.id = character?.id
        self.name = character?.name
        self.status = character?.status
        self.species = character?.species
        self.type = character?.type
        self.gender = character?.gender
        self.originLocation = character?.origin?.name
        self.curentLocation = character?.location?.name
        self.image?.loadImage(urlString: character?.image ?? "")
        makeCellsViewModel()
    }
    
    // MARK: - Make cells view model
    private func makeCellsViewModel() {
        
        if self.name?.isEmpty == false {
            let nameChararcterCellViewModel = CharacterDetailCellViewModel(value: self.name, cellType: .nameCharacter)
            charactersListViewModels.append(nameChararcterCellViewModel)
        }
        if self.status?.isEmpty == false {
            let statusChararcterCellViewModel = CharacterDetailCellViewModel(value: self.status, cellType: .statusCharacter)
            charactersListViewModels.append(statusChararcterCellViewModel)
        }
        if self.species?.isEmpty == false {
            let speciesChararcterCellViewModel = CharacterDetailCellViewModel(value: self.species, cellType: .speciesCharacter)
            charactersListViewModels.append(speciesChararcterCellViewModel)
        }
        if self.type?.isEmpty == false {
            let typeChararcterCellViewModel = CharacterDetailCellViewModel(value: self.type, cellType: .typeCharacter)
            charactersListViewModels.append(typeChararcterCellViewModel)
        }
        if self.gender?.isEmpty == false {
            let genderChararcterCellViewModel = CharacterDetailCellViewModel(value: self.gender, cellType: .gendeCharacter)
            charactersListViewModels.append(genderChararcterCellViewModel)
        }
        if self.originLocation?.isEmpty == false {
            let originLocationChararcterCellViewModel = CharacterDetailCellViewModel(value: self.originLocation, cellType: .originLocationName)
            charactersListViewModels.append(originLocationChararcterCellViewModel)
        }
        if self.curentLocation?.isEmpty == false {
            let curentLocationnChararcterCellViewModel = CharacterDetailCellViewModel(value: self.curentLocation, cellType: .curentLocationName)
            charactersListViewModels.append(curentLocationnChararcterCellViewModel)
        }
    }
    
    func loadInformationCharacter(use id: Int) {
        guard ReachabilityConnect.isConnectedToNetwork() else {
            callAlertBlock?("Oops, you have problem",
                            "The Internet connection appears to be offline") // Текста ошибок, по-хорошому, выносятся в файл локализации,
                                                                             // но тут, я думаю, что не столь крритично это
            return
        }
        networRequests.getFeedCharacter(from: .characterId, use: "\(id)") { (result) in
            switch result {
            case .success(let character):
                guard let networkCharacter = character else { return }
                print(networkCharacter)
                self.character = networkCharacter
                self.requestUpdatedBlock?()
            case .failure(let error):
                self.callAlertBlock?("Error", error.localizedDescription)
                print("This is \(error)")
            }
        }
    }
    
    // MARK: - Methods CarDetailViewModelProtocol
    func detailTableCellViewModel(forIndexPath indexPath: IndexPath) -> CharacterDetailTableCellViewModelProtocol? {
        
        return charactersListViewModels[indexPath.row]
    }
}
