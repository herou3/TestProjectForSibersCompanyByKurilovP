//
//  CharactersImageController.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharactersImageController: UIViewController {
    
    // MARK: - Properties
    private var characterImageViewModel: CharacterImageViewModel?
    private var characterImageView = CharacterImageView()
    
    // MARK: - Init / deinit
    init(viewModel: CharacterImageViewModel) {
        self.characterImageViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.configureCharacterDetailController()
        viewModel.requestUpdatedBlock = { [unowned self] image in
            self.characterImageView.updateImage(image: image)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for CharactersImageController
    private func addCharacterImageView() {
        self.view.addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        characterImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private func configureCharacterDetailController() {
        addCharacterImageView()
    }
}
