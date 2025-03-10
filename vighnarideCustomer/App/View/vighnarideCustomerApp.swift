//
//  vighnarideCustomerApp.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

import SwiftUI

//@main
//struct vighnarideCustomerApp: App {
//    var body: some Scene {
//        WindowGroup {
//            OnboardingRouter.createModule()
//             .onAppear{
//                getFont()
//            }
//        }
//    }
//    
//    func getFont() {
//        // Get all the font family names
//        let fontFamilies = UIFont.familyNames
//        
//        // Iterate through each font family
//        for family in fontFamilies {
//            debugPrint("Family: \(family)")
//            
//            // Get all the font names for the current family
//            let fontNames = UIFont.fontNames(forFamilyName: family)
//            
//            // Print each font name
//            for fontName in fontNames {
//                debugPrint("  Font: \(fontName)")
//            }
//        }
//    }
//}

import SwiftUI

@main
struct VighnarideCustomerApp: App {
    
    @StateObject private var router = CustomerRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                let presenter = CustomerPresenter(interactor: CustomerInteractor(), router: router)
                OnboardingView(presenter: presenter)
                    .navigationDestination(for: AppScreen.self) { screen in
                        switch screen {
                        case .loginOrSignUp:
                            LoginOrSignUpView(presenter: presenter)
                                .navigationBarBackButtonHidden()
                        case .otp:
                            OTPScreenView()
                        default:
                            EmptyView()
                        }
                    }
            }
        }
    }
}
