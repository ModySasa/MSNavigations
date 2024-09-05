//
//  TabBarItem.swift
//  
//
//  Created by Corptia 02 on 13/05/2023.
//

import Foundation
import SwiftUI

public struct TabBarItem : Hashable {
    public static func == (lhs: TabBarItem, rhs: TabBarItem) -> Bool {
        return lhs.index == rhs.index
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
    
    public let iconName: String
    public let unSelectedIconName: String?
    public let title: String
    public let index: Int
    public let hasTabBar: Bool
    public let content: AnyView
    
    public init(
        iconName: String = "",
        unSelectedIconName: String? = nil,
        title: String = "",
        index: Int,
        hasTabBar: Bool = true,
        content: ()->AnyView
    ) {
        self.iconName = iconName
        self.unSelectedIconName = unSelectedIconName
        self.title = title
        self.index = index
        self.hasTabBar = hasTabBar
        self.content = content()
    }
}

