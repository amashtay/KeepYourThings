//
//  ChestEntity.swift
//  Keep Your Things
//
//  Created by Александр on 26.04.2021.
//

import Foundation

struct ChestEntity {
    let id = UUID()
    var name: String
    var things = [ThingEntity]()
}
