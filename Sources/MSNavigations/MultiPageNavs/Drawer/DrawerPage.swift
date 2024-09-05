//
//  DrawerPage.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import Foundation
import SwiftUI

public struct DrawerPage<Background:View , ItemView:View , Header : View , Footer : View>: View {
    @Binding var selection : Int
    @Binding var isDrawerOn : Bool
    var tabs : [DrawerItem]
    var tabView : ((DrawerItem)-> ItemView)!
    var background : Background
    var header : Header
    var footer : Footer
    var paddingVertical : CGFloat = 20
    var paddingHorizontal : CGFloat = 20
    
    @Namespace private var nameSpace
    
    public init(
        tabs: [DrawerItem],
        selection: Binding<Int>,
        isDrawerOn: Binding<Bool>,
        paddingVertical:CGFloat = 20,
        paddingHorizontal:CGFloat = 20,
        tabView: @escaping (DrawerItem) -> ItemView,
        @ViewBuilder background: ()-> Background,
        @ViewBuilder header: ()-> Header,
        @ViewBuilder footer: ()-> Footer
    ) {
        self.tabs = tabs
        self._selection = selection
        self._isDrawerOn = isDrawerOn
        self.tabView = tabView
        self.background = background()
        self.header = header()
        self.footer = footer()
        self.paddingVertical = paddingVertical
        self.paddingHorizontal = paddingHorizontal
    }
    
    public var body: some View {
        VStack {
            header
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(tabs, id: \.self) { tab in
                        tabView(tab)
                            .onTapGesture {
                                if(tab.hasPage) {
                                    switchToTab(tab.index)
                                }
                                if let onTapped = tab.onTap {
                                    onTapped()
                                }
                            }
                    }
                }
            }
            Spacer()
            footer
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .frame(maxHeight: .infinity , alignment: .top)
        .padding(.vertical , paddingVertical)
        .padding(.horizontal , paddingHorizontal)
        .background(
            ZStack {
                Color.clear
                background
            }
                .edgesIgnoringSafeArea(.leading)
        )
    }
    
    func switchToTab(_ index: Int) {
        withAnimation(.easeOut) {
            selection = index
            isDrawerOn = false
        }
    }
}
