//
//  MainViewInput.swift
//  Keep Your Things
//
//  Created by Александр on 25.04.2021.
//

import Foundation

protocol MainViewInput: AnyObject {

    func updateChests(chests: [ChestCellObject])
    
    func updateSeasons(seasons: [SeasonCellObject])
    
    func updateTags(tags: [TagCellObject])
}
