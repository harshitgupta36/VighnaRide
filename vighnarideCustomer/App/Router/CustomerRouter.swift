//
//  Router.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

import SwiftUI

enum AppScreen: Hashable {
    case onboarding
    case loginOrSignUp
    case otp
}



class CustomerRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateToLoginOrSignUp() {
        path.append(AppScreen.loginOrSignUp)
    }
    
    func navigateToOTP() {
        path.append(AppScreen.otp)
    }
    
    func popToBack(){
        path.removeLast()
    }
    
}

