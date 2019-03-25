//
//  CharacterImageTableCell.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterImageTableCell: DefaultCell {
    
    // MARK: - Properties
    private var cellType: DefaultCellType?
    
    // MARK: - Init table cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder!) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var characterImageView : CachedImageView = {
        let characterImageView = CachedImageView()
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = CGFloat(Constant.characterImageSizeValue) / 2 - (Constant.marginLeftAndRightValue / 2)
        return characterImageView
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure character detail cell
    private func addCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        characterImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: self.bottomAnchor,
                                      constant: -Constant.marginLeftAndRightValue / 16 ).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: Constant.marginLeftAndRightValue / 8).isActive = true
    }
    
    override func setupViews() {
        addCharacterImageView()
        addLineView()
        self.backgroundColor = UIColor.aliceBlue
    }
    
    func configure(with viewModel: CharacterDetailTableCellViewModelProtocol) {
        self.characterImageView.loadImage(urlString: viewModel.value ?? "")
    }
}
