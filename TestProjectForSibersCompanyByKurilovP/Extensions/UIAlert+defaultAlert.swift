//
//  UIAlert+defaultAlert.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Show default alert
    func defaultAlert(with title: String,
                      message: String,
                      action: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: title, style: .default) { (_) in
            action()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.view.tintColor = UIColor.darkTurquoise
        self.present(alert, animated: true, completion: nil)
    }
}
