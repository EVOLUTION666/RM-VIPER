//
//  DetailModuleBuilder.swift
//  Super easy dev
//
//  Created by Andrey on 09.09.2023
//

import UIKit

class DetailModuleBuilder {
    static func build(characterInfo: Result) -> DetailViewController {
        let interactor = DetailInteractor(characterInfo: characterInfo)
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let viewController = DetailViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
