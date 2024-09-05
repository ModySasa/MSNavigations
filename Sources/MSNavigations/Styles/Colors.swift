//
//  Colors.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import SwiftUI

public struct NavigationColors {
    public let backgroundColor: Color
    public let barTextColor: Color
    public let btmNavSelectedTextColor: Color
    public let btmNavUnSelectedTextColor: Color
    
    public init(
        backgroundColor: Color
        , barTextColor: Color
        , btmNavSelectedTextColor: Color
        , btmNavUnSelectedTextColor: Color
    ) {
        self.backgroundColor = backgroundColor
        self.barTextColor = barTextColor
        self.btmNavSelectedTextColor = btmNavSelectedTextColor
        self.btmNavUnSelectedTextColor = btmNavUnSelectedTextColor
    }
}
