//
//  ModuleBuilder.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
//    static func createDetailsModule(comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
//    static func createDetailsModule(comment: Comment?) -> UIViewController {
//        let view = DetailsViewController()
//        let networkService = NetworkService()
//        let presenter = DetailsPresenter(view: view, networkService: networkService, comment: comment)
//        view.presenter = presenter
//        return view
//    }

    
    
}
