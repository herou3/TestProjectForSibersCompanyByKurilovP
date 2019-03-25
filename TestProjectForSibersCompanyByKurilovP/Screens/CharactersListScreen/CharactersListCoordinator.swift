//
//  CharactersListCoordinator.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol UpdateableWitchCharactersList: class {
    var character: Character? { get set }
}

final class CharactersListCoordinator {

    // MARK: - Properties
    private weak var navigationController: UINavigationController?
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.barTintColor = .gray
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func start() {
        showCharactersList()
    }
    
    // MARK: - Private implementation
    private func showCharactersList() {
        let charactersViewModel = CharactersListViewModel()
        charactersViewModel.delegate = self
        let controller = CharactersListController(viewModel: charactersViewModel)
        navigationController?.pushViewController(controller, animated: false)
        controller.navigationItem.title = "Characters List"
    }
}

extension CharactersListCoordinator: CharactersListViewModelDelegate {
    
    func charactersListViewModel(_ viewModel: CharactersListViewModel, didSelectCar character: Character) {
        
    }
}
