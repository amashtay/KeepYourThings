//
//  ChestCellObject.swift
//  Keep Your Things
//
//  Created by Александр on 23.04.2021.
//

import Foundation

struct ChestCellObject {
    var roomTitle: String
    var imageName: String
    var thingsCount: Int
    
    var chest: ChestEntity?
    
    init(chest: ChestEntity) {
        roomTitle = chest.name
        imageName = ""
        thingsCount = chest.things.count
    }
}
