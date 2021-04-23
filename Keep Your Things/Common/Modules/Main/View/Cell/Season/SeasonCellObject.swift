//
//  SeasonCellObject.swift
//  Keep Your Things
//
//  Created by Александр on 24.04.2021.
//

import Foundation

enum Season: Int {
    case winter = 0
    case spring
    case summer
    case fall
}

struct SeasonCellObject {
    let season: Season
    var action: (() -> ())?
}
