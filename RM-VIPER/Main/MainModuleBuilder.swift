//
//  MainModuleBuilder.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import UIKit

class MainModuleBuilder {
    static func build() -> MainViewController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(router: router, interactor: interactor)
        let viewController = MainViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
