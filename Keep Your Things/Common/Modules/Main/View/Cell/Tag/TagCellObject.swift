//
//  TagCellObject.swift
//  Keep Your Things
//
//  Created by Александр on 26.04.2021.
//

import Foundation

struct TagCellObject {
    var name: String
    var backgroundColor: String
    
    var action: (()-> ())?
    
    init(entity: TagEntity) {
        name = entity.name
        backgroundColor = entity.backgroundColor
    }
}
