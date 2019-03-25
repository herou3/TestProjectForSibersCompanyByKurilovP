//
//  HudHelper.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class HUD {
    
    // MARK: - HUD properties
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: - HUD methods show and hide
    func showActivityIndicatory(view: UIView) {
        
        // MARK: - Configure elements HUD
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.3, blue: 0.3, alpha: 0.8)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        view.addSubview(loadingView)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(view: UIView) {
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }
}
