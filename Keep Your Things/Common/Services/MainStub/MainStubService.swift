//
//  MainStubService.swift
//  Keep Your Things
//
//  Created by Александр on 26.04.2021.
//

import UIKit

let mainStubServiceUnknownErrorCode = 700
enum MainStubServiceError: Error {
    case error(message: String, code: Int)
}

final class MainStubService {
    let chests: [ChestEntity] = [
        ChestEntity(name: "Гостиная"),
        ChestEntity(name: "Кухня"),
        ChestEntity(name: "Спальня"),
        ChestEntity(name: "Коридор"),
    ]
    
    var tags: [TagEntity] = [
        TagEntity(name: "Оверсайз", backgroundColor: "00FF00"),
        TagEntity(name: "Старый хлам", backgroundColor: "FF0000"),
        TagEntity(name: "Обувь для отдыха", backgroundColor: "0000FF"),
        TagEntity(name: "Одежда для аутдора", backgroundColor: "0000FF"),
        TagEntity(name: "Костюм с выпускного", backgroundColor: "FF0000"),
        TagEntity(name: "Свитер с оленями", backgroundColor: "FFFF00")
    ]
}

extension MainStubService: StorageServiceProtocol {

    func getChests(completion: ((Result<[ChestEntity]?, MainStubServiceError>) -> ())?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            completion?(.success(self?.chests))
        }
    }
    
    func getThings(completion: ((Result<[ThingEntity]?, MainStubServiceError>)-> ())?) {
        completion?(.failure(.error(message: "Заглушка метода", code: mainStubServiceUnknownErrorCode)))
    }
    
    func getTags(completion: ((Result<[TagEntity]?, MainStubServiceError>) -> ())?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            completion?(.success(self?.tags))
        }
    }
    
}
