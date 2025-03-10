//
//  SplashView.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

//
//  SplashView.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

import SwiftUI

/// A view that displays the splash screen for the app.
///
/// The splash screen shows a background gradient, the app logo, a safety message,
/// and a "Get Started" button. The layout is responsive using GeometryReader.
struct OnboardingView: View {
    @ObservedObject var presenter: CustomerPresenter

    var body: some View {
        ZStack {
            // Background gradient filling the entire screen.
            LinearGradient(
                gradient: Gradient(colors: [Color(AppColor.primaryColor), Color(AppColor.secondaryColor)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    // App Logo positioned in the upper part of the screen.
                    Image(ImageName.logoApp) // Replace with your actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6,
                               height: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2,
                                  y: geometry.size.height * 0.4)
                        .shadow(radius: 0.5)
                    
                    VStack(spacing: 16) {
                        // Safety Message with an icon.
                        HStack(spacing: 10) {
                            Text(TittleLabel.moveWithSafety)
                                .font(.subheadline)
                                .foregroundColor(AppColor.FontColor.white)
                            
                            Image(ImageName.shield) // Safety icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }
                        .padding([.leading, .trailing], 12)
                        .padding([.top, .bottom], 8)
                        .frame(width: geometry.size.width * 0.6)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        // "Get Started" Button
                        GetStartedButton(width: geometry.size.width * 0.8, height: 58)
                            .padding(.bottom, 15)
                            .onTapGesture {
                                presenter.getStartedTapped()
                            }
                    }
                    .padding(.top, 80)
                }
            }
        }
    }
}

/// A view that represents the "Get Started" button with an arrow icon.
struct GetStartedButton: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack(spacing: 20) {
            Text(TittleLabel.getStarted)
                .font(.headline)
                .foregroundColor(AppColor.FontColor.white)
            
            Image(ImageName.arrow) // Arrow icon
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .frame(width: width, height: height, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [AppColor.primaryColor, AppColor.secondaryColor]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        )
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 12, x: -4, y: 4)
        .shadow(color: .black.opacity(0.25), radius: 12, x: 4, y: 4)
    }
}

#Preview {
    var onboardingInteractor = CustomerInteractor()
    var router = CustomerRouter()

    OnboardingView(presenter: .init(interactor: onboardingInteractor, router: router))
}
