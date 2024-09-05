//
//  DrawerItem.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import Foundation

public struct DrawerItem : Identifiable , Hashable {
    public let id: String = UUID().uuidString

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: DrawerItem, rhs: DrawerItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public static func != (lhs: DrawerItem, rhs: DrawerItem) -> Bool {
        return lhs.id != rhs.id
    }
    
    public let iconName: String
    public let title: String
    public let index: Int
    public let hasIcon: Bool
    public let isDraggable: Bool
    public let hasPage: Bool
    public let onTap: (()->Void)!
    
    public init(
        iconName: String = "",
        title: String,
        index: Int,
        hasIcon: Bool = false,
        isDraggable: Bool = true,
        hasPage: Bool = true,
        onTap: @escaping ()->Void
    ) {
        self.iconName = iconName
        self.title = title
        self.index = index
        self.hasIcon = hasIcon
        self.isDraggable = isDraggable
        self.hasPage = hasPage
        self.onTap = onTap
    }
}
