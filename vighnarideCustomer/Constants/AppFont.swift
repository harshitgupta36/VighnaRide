//
//  AppFont.swift
//  vighnarideCustomer
//
//  Created by Harshit Gupta on 01/03/25.
//

import SwiftUI

// MARK: - Enum for Roboto Font
import SwiftUI

enum AppFont: String {
    case bold = "Roboto-Bold"
    case semiBold = "Roboto-SemiBold"
    case medium = "Roboto-Medium"
    case regular = "Roboto-Regular"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"

    // Function to get UIFont (for UIKit)
    func getFont(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    func getFont(size: CGFloat) -> Font {
        return .custom(self.rawValue, size: size)
    }
}

extension Font {
    static func appFont(_ font: AppFont, size: CGFloat) -> Font {
        return .custom(font.rawValue, size: size)
    }
    
    static let largeTitle = Font.appFont(.bold, size: 34)
    static let title = Font.appFont(.semiBold, size: 28)
    static let title2 = Font.appFont(.medium, size: 22)
    static let title3 = Font.appFont(.medium, size: 20)
    static let headline = Font.appFont(.bold, size: 17)
    static let subheadline = Font.appFont(.regular, size: 15)
    static let body = Font.appFont(.regular, size: 17)
    static let callout = Font.appFont(.italic, size: 16)
    static let footnote = Font.appFont(.light, size: 13)
    static let caption = Font.appFont(.thin, size: 12)
    static let caption2 = Font.appFont(.thinItalic, size: 11)
}
