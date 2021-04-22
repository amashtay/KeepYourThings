//
//  StoryCellObject.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//

import Foundation

struct StoryCellObject {

    let title: String?
    var isRead: Bool
    
    var action: (() -> ())?
    
    // MARK: Initializer
    
    init(title: String?,
         isRead: Bool = false,
         action: (() -> ())? = nil) {
        
        self.title = title
        self.isRead = isRead
        self.action = action
    }
}
