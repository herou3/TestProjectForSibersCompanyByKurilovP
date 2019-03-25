//
//  DiscardableImageCacheItem.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

open class DiscardableImageCacheItem: NSObject, NSDiscardableContent {
    
    // MARK: - Properties
    private(set) public var image: UIImage?
    var accessCount: UInt = 0
    
    // MARK: - Init
    public init(image: UIImage) {
        self.image = image
    }
    
    // MARK: - Public methodes
    public func beginContentAccess() -> Bool {
        if image == nil {
            return false
        }
        
        accessCount += 1
        return true
    }
    
    public func endContentAccess() {
        if accessCount > 0 {
            accessCount -= 1
        }
    }
    
    public func discardContentIfPossible() {
        if accessCount == 0 {
            image = nil
        }
    }
    
    public func isContentDiscarded() -> Bool {
        return image == nil
    }
    
}
