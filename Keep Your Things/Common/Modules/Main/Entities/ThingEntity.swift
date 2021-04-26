//
//  ThingEntity.swift
//  Keep Your Things
//
//  Created by Александр on 26.04.2021.
//

import Foundation

enum Season: Int {
    case winter = 0
    case spring
    case summer
    case fall
}

struct ThingEntity {
    var name: String
    //var image: UIImage? = nil
    var description: String
    var size: String?
    var seasons: [Season]?
}
