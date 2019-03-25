//
//  Alert.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

struct Alert {
    
    // MARK: - Show default alert
    static func showBasicAlert(on vicewController: UIViewController,
                               with title: String,
                               message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { (_) in
                                        vicewController.dismiss(animated: true,
                                                                completion: nil)
        }))
        vicewController.present(alert,
                                animated: true)
    }
}
