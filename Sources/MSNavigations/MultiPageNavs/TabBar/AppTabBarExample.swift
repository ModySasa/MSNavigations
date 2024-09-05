//
//  AppTabBarExample.swift
//
//
//  Created by Corptia 02 on 13/05/2023.
//

import SwiftUI

struct AppTabBarExample: View {
    @State var selection : Int = 0
    @State var hasTabBar : Bool = true
    
    var pages : [TabBarPages] = .init(arrayLiteral: .Favs , .Profile , .Settings , .Notifications)
    
    var body: some View {
        CustomTabBarContainerView(selection: $selection,tabs: pages.map({ page in
            return page.item()
        })) { tab in
            AnyView (
                VStack {
                    Image(systemName: tab.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                    Text(tab.title)
//                        .textStyle(.tabBar, fontWeight: .bold)
                }
                    .frame(maxWidth: .infinity)
            )
        } background: {
            Rectangle()
                .fill(
                    .white
                )
                .cornerRadius(8)
            
        }
    }
}

struct AppTabBarExample_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarExample()
    }
}

enum TabBarPages : Hashable {
    case Favs
    case Profile
    case Settings
    case Notifications
    
    @ViewBuilder func view(_ selection:Binding<Int>) -> some View {
        switch self{
        case .Favs:
            CustomNavBarContainerView(.green, textStyleModifier: AnyMod()) {
                Text("Favorites")
                .setCustomAppBar(title: "Test", hasBack: false)
            }
            
        case .Profile:
            CustomNavBarContainerView(.green, textStyleModifier: AnyMod()) {
                Text("Profile")
                .setCustomAppBar(title: "Test", hasBack: false)
            }
        case .Settings:
            Text("Settings")
            
        case .Notifications:
            Text("Notifications")
        }
    }
    
    func item()->TabBarItem {
        switch self {
        case .Favs:
            return .init(iconName: "heart", title: "Favs", index: 0) {
                AnyView(CustomNavBarContainerView(.green, textStyleModifier: AnyMod()) {
                    Text("Favorites")
                    .setCustomAppBar(title: "Test", hasBack: false)
                })
            }
        case .Profile:
            return .init(iconName: "person", title: "Profile", index: 1) {
                AnyView(CustomNavBarContainerView(.green, textStyleModifier: AnyMod()) {
                    Text("Profile")
                    .setCustomAppBar(title: "Test", hasBack: false)
                })
            }
        case .Settings:
            return .init(iconName: "gear", title: "Settings", index: 2) {
                AnyView(
                    Text("Settings")
                )
            }
        case .Notifications:
            return .init(iconName: "bell", title: "Notifications", index: 3 , hasTabBar: false) {
                AnyView(
                    Text("Notifications")
                )
            }
        }
    }
}
