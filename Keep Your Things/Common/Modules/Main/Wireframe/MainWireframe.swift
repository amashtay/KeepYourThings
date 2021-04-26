//
//  MainWireframe.swift
//  Keep Your Things
//
//  Created by Александр on 24.04.2021.
//

import UIKit

final class MainWireframe {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let presenter = MainPresenter()
        presenter.storageService = MainStubService()
        presenter.controller = viewController
        viewController.presenter = presenter
        
        let router = MainRouter()
        presenter.router = router
        router.presenter = presenter
        router.controller = viewController
        
        return viewController
    }
}


