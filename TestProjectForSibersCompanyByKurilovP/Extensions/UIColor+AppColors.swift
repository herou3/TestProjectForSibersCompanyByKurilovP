//
//  UIColor+AppColors.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Method for construct color
    static func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // MARK: - Class properties
    class var darkTurquoise: UIColor {
        return color(0, 206, 209)
    }
}
