//
//  CustomTabBarContainerView.swift
//
//
//  Created by Corptia 02 on 13/05/2023.
//

import SwiftUI

public struct CustomTabBarContainerView<Background:View>: View {
    @Binding var selection : Int
    var tabs : [TabBarItem]
    @State var hasTabBar : Bool = true
    
    //    let content : Content
    let background : Background
    var itemView : ((TabBarItem)-> AnyView)!
    
    let isContentWithAppBar : Bool
    var pageBottomPadding: CGFloat = MSNavigations.shared.sizes.tabBarHeight
    
    public init(
        selection :Binding<Int> ,
        isContentWithAppBar :Bool = false ,
        pageBottomPadding: CGFloat = MSNavigations.shared.sizes.tabBarHeight,
        tabs: [TabBarItem],
        itemView:@escaping (TabBarItem)->AnyView,
        @ViewBuilder background: ()-> Background
    ) {
        self.isContentWithAppBar = isContentWithAppBar
        self.pageBottomPadding = pageBottomPadding
        self._selection = selection
        self.tabs = tabs
        self.itemView = itemView
        self.background = background()
    }
    
    @State var dialog : DialogEquatableViewContainer = DialogEquatableViewContainer(view: AnyView(EmptyView()))
    @State var showDialog = false
    
    public var body: some View {
        if(isContentWithAppBar) {
            mainBody
                .initDialogWithAppBar($showDialog) {
                    dialog.view
                }
                .padding(.top, showDialog ? -(/*swiftuiHelper.margins.backBarPaddingBottom + */MSNavigations.shared.sizes.appBarHeight) : 0)
        } else {
            mainBody
        }
    }
    
    var mainBody : some View {
        ZStack {
            tabs[selection].content
                .ignoresSafeArea()
                .padding(.bottom, pageBottomPadding)
                .onPreferenceChange(TabBarHasDialogBarPrefKey.self) { val in
                    self.showDialog = val
                }
                .onPreferenceChange(TabBarDialogViewPrefKey.self) { val in
                    self.dialog = val
                }
                .onPreferenceChange(HasTabBarViewPreferenceKey.self) { value in
                    self.hasTabBar = value
                }
            if(tabs[selection].hasTabBar) {
                VStack(spacing:0) {
                    Spacer()
                    CustomTabBarView(
                        tabs: tabs,
                        selection: $selection
                    ) { tab in
                        itemView(tab)
                    } background: {
                        background
                    }
                }
            }
            if(!isContentWithAppBar) {
                if(showDialog) {
                    dialog.view
                }
            }
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarExample()
    }
}
