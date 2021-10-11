//
//  MainPresenter.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import Foundation

//input protocol
protocol MainViewProtocol: AnyObject {
    // AnyObject - weak reference
    func success()
    func failure(error: Error)
}

//output protocol
protocol MainViewPresenterProtocol: AnyObject {
    //presenter maintain View and Model
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [ImageAndComments]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var comments: [ImageAndComments]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getCommentsAndImages { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
