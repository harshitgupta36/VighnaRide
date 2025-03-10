//
//  Presenter.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

import Foundation

protocol CustomerPresenterProtocol: ObservableObject {
    func getStartedTapped()

}

class CustomerPresenter: CustomerPresenterProtocol {
    private let interactor: CustomerInteractorProtocol
    private let router: CustomerRouter

    init(interactor: CustomerInteractorProtocol, router: CustomerRouter) {
            self.interactor = interactor
            self.router = router
        }

   func getStartedTapped() {
       router.navigateToLoginOrSignUp()
    }
    
    func previousButton(){
        router.popToBack()
    }
}
