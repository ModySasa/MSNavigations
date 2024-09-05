//
//  TabBarItemsPrefKey.swift
//  
//
//  Created by Corptia 02 on 13/05/2023.
//

import Foundation
import SwiftUI

public struct HasTabBarViewPreferenceKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public extension View {
    func hasTabBarView(_ hasBar : Bool = true) -> some View {
        preference(key: HasTabBarViewPreferenceKey.self, value: hasBar)
    }
}
