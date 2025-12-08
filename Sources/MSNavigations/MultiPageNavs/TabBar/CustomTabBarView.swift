//
//  CustomTabBarView.swift
//  
//
//  Created by Corptia 02 on 13/05/2023.
//

import SwiftUI

public struct CustomTabBarView<Background:View>: View {
    @Binding var selection : Int
    var tabs : [TabBarItem]
    var tabView : ((TabBarItem)-> AnyView)!
    var background : Background
    
    @Namespace private var nameSpace
    
    public init(
        tabs: [TabBarItem],
        selection: Binding<Int>,
        tabView: @escaping (TabBarItem) -> AnyView,
        @ViewBuilder background: ()-> Background
    ) {
        self.tabs = tabs
        self._selection = selection
        self.tabView = tabView
        self.background = background()
    }
    
    public var body: some View {
        HStack(spacing:0) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab)
                    .foregroundColor(
                        tab.index == selection ?
                        MSNavigations.shared.colors.btmNavSelectedTextColor : MSNavigations.shared.colors.btmNavUnSelectedTextColor
                    )
                    .onTapGesture {
                        switchToTab(tab.index)
                    }
            }
        }
        .frame(height: MSNavigations.shared.sizes.tabBarHeight)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, MSNavigations.shared.sizes.tabBarHorizontalPadding)
        .padding(.bottom, MSNavigations.shared.sizes.tabBarBottomPadding)
        .background(
            ZStack {
                Color.clear
                background
            }
                .edgesIgnoringSafeArea(.bottom)
        )
    }
    
    func switchToTab(_ index: Int) {
        withAnimation(.easeOut) {
            selection = index
            print("TEST PAGES :::::: \(index) :::: \(selection)")
        }
    }
}
