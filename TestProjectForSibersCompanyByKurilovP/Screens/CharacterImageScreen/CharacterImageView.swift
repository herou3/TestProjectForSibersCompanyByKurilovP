//
//  CharacterImageView.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterImageView: UIView {
    
    // MARK: - Init / deinit
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create UIElements for CharactersImageController
    private var characterImageView: UIImageView = {
        var characterImageView: UIImageView = UIImageView()
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.image = UIImage(named: "unknown-icon")
        return characterImageView
    }()
    
    // MARK: - Configure ContactImageView
    private func addCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        characterImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        characterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        characterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        addCharacterImageView()
    }
    
    // MARK: - Method for update imageView
    func updateImage(image: UIImage) {
        characterImageView.image = image
    }
}
