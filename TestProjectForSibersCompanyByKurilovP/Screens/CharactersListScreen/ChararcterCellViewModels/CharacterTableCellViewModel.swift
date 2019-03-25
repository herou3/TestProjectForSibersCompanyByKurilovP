//
//  CharacterTableCellViewModel.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterTableCellViewModel: CharactersListTableCellViewModelProtocol {
    
    // MARK: - Properies
    private var character: Character
    
    var name: String {
        return character.name ?? ""
    }
    
    var status: String {
        return character.status ?? ""
    }
    
    var species: String {
        return character.species ?? ""
    }
    
    var gender: String {
        return character.gender ?? ""
    }
    
    var image: String {
        return character.image ?? ""
    }
    
    // MARK: - Init / deinit
    init(character: Character) {
        self.character = character
    }
}
