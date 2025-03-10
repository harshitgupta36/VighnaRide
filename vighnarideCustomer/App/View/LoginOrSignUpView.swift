//
//  LoginOrSignUpView.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 02/03/25.
//

import SwiftUI

struct LoginOrSignUpView: View {
    
    @ObservedObject var presenter: CustomerPresenter

    // MARK: - Constants
    
    private struct Constants {
        static let countryCodes = ["+1", "+44", "+91", "+61", "+81"]
        static let placeholderPhoneNumber = "Enter phone number"
        static let nextButtonText = "Next"
        static let titleText = "Enter your mobile number"
        static let descriptionText = "By continuing you may receive an SMS for verification. Message and data rates may apply."
        static let defaultCountryCode = "+1" // Default country code (USA)
    }
    
    // MARK: - State Variables
    
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode = Constants.defaultCountryCode
    
    var body: some View {
        ZStack {
            AppColor.backgroundColor
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Title Text
                    Text(Constants.titleText)
                        .foregroundStyle(.white)
                        .font(AppFont.medium.getFont(size: 30))
                    
                    // Phone number input section with country code picker
                    HStack {
                        // Country Code Picker
                        Picker("Country Code", selection: $selectedCountryCode) {
                            ForEach(Constants.countryCodes, id: \.self) { code in
                                Text(code)
                            }
                        }
                        .pickerStyle(MenuPickerStyle()) // You can change the picker style here
                        .frame(width: geometry.size.width * 0.2)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(.top, 20)
                        
                        Spacer()
                        // Phone number TextField
                        TextField(Constants.placeholderPhoneNumber, text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(5)
                            .frame(width: geometry.size.width * 0.65)
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    // Description Text
                    VStack(alignment: .center){
                        Text(Constants.descriptionText)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        
                        
                        // Next Button
                        Text(Constants.nextButtonText)
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: geometry.size.width * 0.8,height: 50)
                            .background(.black)
                            .padding()



                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
        .toolbar {
            // Custom toolbar items if needed
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presenter.previousButton()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
            
        }
    }
}

//#Preview {
//    LoginOrSignUpView(presenter: <#CustomerPresenter#>)
//}
