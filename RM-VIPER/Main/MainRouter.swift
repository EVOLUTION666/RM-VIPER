//
//  MainRouter.swift
//  RM-VIPER
//
//  Created by Andrey on 01.09.2023.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    func openCharacterDetail(for character: Result)
}

class MainRouter: MainRouterProtocol {
    weak var viewController: MainViewController?
    
    func openCharacterDetail(for character: Result) {
        let vc2 = UINavigationController(rootViewController: DetailModuleBuilder.build(characterInfo: character))
        let vc = DetailModuleBuilder.build(characterInfo: character)
        vc2.modalPresentationStyle = .fullScreen
        viewController?.present(vc2, animated: true)
    }
}
