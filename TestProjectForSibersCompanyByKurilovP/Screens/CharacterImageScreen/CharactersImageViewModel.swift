//
//  CharacterImageViewModel.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterImageViewModel: CharacterImageViewModelProtocol {
    
    // MARK: - Properties
    var image: UIImageView?
    var requestUpdatedBlock: ((_ image: UIImage) -> Void)?
    
    // MARK: - Init
    init(characterImageCellViewModel: CharacterImageCellViewModel) {
        
        guard let url = URL(string: characterImageCellViewModel.value ?? "") else {
            return
        }
        self.image = self.dowloadFromServer(url: url, contentMode: .scaleAspectFit)
    }
    
    // MARK: - Configure
    func configure(image: UIImageView) {
        self.image = image
    }
    
    // MARK: - internal method
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                imageView.image = image
                self.requestUpdatedBlock?(image)
            }
            }.resume()
        return imageView
    }
}
