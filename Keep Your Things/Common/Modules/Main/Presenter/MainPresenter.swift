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
}

extension MainPresenter: MainViewOutput {
    
    func moduleWasLoad() {
        print("module was loaded")
    }
    
}
