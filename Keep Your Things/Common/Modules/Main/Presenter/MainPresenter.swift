//
//  MainPresenter.swift
//  Keep Your Things
//
//  Created by Александр on 25.04.2021.
//

import Foundation

final class MainPresenter {
    weak var controller: MainViewInput?
    var router: MainRouterInput?
    
    var storageService: StorageServiceProtocol?
    
    var chests = [ChestEntity]()

    var seasons: [SeasonCellObject] = [
        SeasonCellObject(season: .winter, action: nil),
        SeasonCellObject(season: .spring, action: nil),
        SeasonCellObject(season: .summer, action: nil),
        SeasonCellObject(season: .fall, action: nil)
    ]
    
    var tags = [TagEntity]()
    
    
    private func configureChests() -> [ChestCellObject] {
        chests.map { ChestCellObject(chest: $0) }
    }
    
    private func configureTags() -> [TagCellObject] {
        tags.map { TagCellObject(entity: $0) }
    }
//    private func configureThings() -> [] {
//        [ThingEntity]()
//    }
}

extension MainPresenter: MainViewOutput {
    
    func moduleWasLoad() {
        storageService?.getChests() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let entities):
                if let entities = entities {
                    self.chests = entities
                }
            case .failure(.error(message: let message, code: _)):
                // TODO: обработать ошибки
                print(message)
            }
            self.controller?.updateChests(chests: self.configureChests())
        }
        
        storageService?.getTags() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let entities):
                if let entities = entities {
                    self.tags = entities
                }
            case .failure(.error(message: let message, code: _)):
                // TODO: обработать ошибки
                print(message)
            }
            self.controller?.updateTags(tags: self.configureTags())
            
        }
        controller?.updateSeasons(seasons: seasons)
        
    }
    
}
