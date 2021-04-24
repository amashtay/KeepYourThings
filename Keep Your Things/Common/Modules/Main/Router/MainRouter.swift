//
//  MainRouter.swift
//  Keep Your Things
//
//  Created by Александр on 25.04.2021.
//

import UIKit

final class MainRouter {
    weak var presenter: MainViewOutput?
    weak var controller: UIViewController?
}

extension MainRouter: MainRouterInput {
    
}
