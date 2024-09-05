//
//  DrawerPrefKeys.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import Foundation
import SwiftUI

public struct DrawerHasIconPreferenceKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct DrawerIsDragablePreferenceKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct DrawerItemsPreferenceKey : PreferenceKey {
    public static var defaultValue: [DrawerItem] = .init()
    
    public static func reduce(value: inout [DrawerItem], nextValue: () -> [DrawerItem]) {
        value += nextValue()
    }
    
}

public struct DrawerItemViewModifier : ViewModifier {
    let tab:DrawerItem
    @Binding var selection: Int
    
    public func body(content: Content) -> some View {
        content
            .opacity(tab.index == selection ? 1 : 0)
            .preference(key: DrawerItemsPreferenceKey.self, value: [tab])
            .setDrawerHasIcon(tab.index == selection ? tab.hasIcon : false)
            .setDrawerDragable(tab.index == selection ? tab.isDraggable : false)
        
//        if(tab.index == selection) {
//            content
//                .opacity(1)
//                .preference(key: DrawerItemsPreferenceKey.self, value: [tab])
//                .setDrawerHasIcon(tab.hasIcon)
//                .setDrawerDragable(tab.isDraggable)
//        } else {
//            content
//                .opacity(0)
//                .preference(key: DrawerItemsPreferenceKey.self, value: [tab])
//        }
    }
}

public extension View {
    func setDrawerHasIcon(_ val : Bool = true) -> some View {
        preference(key: DrawerHasIconPreferenceKey.self, value: val)
    }
    
    func setDrawerDragable(_ val : Bool = true) -> some View {
        preference(key: DrawerIsDragablePreferenceKey.self, value: val)
    }
    
    func drawerItem(_ tab:DrawerItem , selection:Binding<Int>) ->some View {
        modifier(DrawerItemViewModifier(tab: tab , selection:selection))
    }
}
