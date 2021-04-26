//
//  StorageServiceProtocol.swift
//  Keep Your Things
//
//  Created by Александр on 26.04.2021.
//

import Foundation

protocol StorageServiceProtocol: AnyObject {
    
    func getChests(completion: ((Result<[ChestEntity]?, MainStubServiceError>) -> ())?)
    
    func getThings(completion: ((Result<[ThingEntity]?, MainStubServiceError>) -> ())?)
    
    func getTags(completion:((Result<[TagEntity]?, MainStubServiceError>) -> ())?)
    
}
