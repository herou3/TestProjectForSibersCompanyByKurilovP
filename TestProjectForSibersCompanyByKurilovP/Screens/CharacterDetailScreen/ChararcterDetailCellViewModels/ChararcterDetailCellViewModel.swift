//
//  ChararcterDetailCellViewModel.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

class CharacterDetailCellViewModel: CharacterDetailTableCellViewModelProtocol {
    
    // MARK: - Properties
    var value: String?
    var cellType: DefaultCellType?
    
    // MARK: - init / deinit
    init(value: String?, cellType: DefaultCellType) {
        self.cellType = cellType
        self.configure(with: value)
    }
    
    // MARK: - Configure self
    func configure(with value: String?) {
        self.value = value
    }
}
