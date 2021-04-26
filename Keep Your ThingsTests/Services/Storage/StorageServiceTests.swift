//
//  StorageServiceTests.swift
//  Keep Your ThingsTests
//
//  Created by Александр on 27.04.2021.
//

import XCTest

@testable import Keep_Your_Things

class StorageServiceTests: XCTestCase {

    var mainStubService: StorageServiceProtocol?
    
    override func setUpWithError() throws {
        mainStubService = MainStubService()
    }

    override func tearDownWithError() throws {
        mainStubService = nil
    }

    func getChestWithSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation = XCTestExpectation(description: "Асинхронный вызов метода getChest")
        
        // GIVEN
        // ...
        
        // WHEN
        mainStubService?.getChests { result in
            switch result {
            case .success(let entities):
                if let entities = entities {
                    // THEN
                    XCTAssert(entities.count > 0, "Пустой результат")
                } else {
                    XCTFail("Пустой результат")
                }
            case .failure(.error(message: _, code: _)):
                XCTFail("Вызвался failure блок")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
        
        // можно проверить вызвался ли какой-нибудь метод ?
        
        
    }

}
