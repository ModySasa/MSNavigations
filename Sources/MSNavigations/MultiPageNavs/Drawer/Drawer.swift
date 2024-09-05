//
//  Drawer.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import SwiftUI

public struct Drawer<Content:View , BurgerIcon : View , Background:View , DrawerBackground:View , ItemView:View , DrawerHeader:View , DrawerFooter:View> : View {
    
    let isArabic : Bool
    @Binding var selection : Int
    @State var tabs : [DrawerItem] = .init()

    let background : Background
    let drawerBackground : DrawerBackground
    let drawerHeader : DrawerHeader
    let drawerFooter : DrawerFooter

    var itemView : ((DrawerItem)-> ItemView)!
    
    var burgerIcon : BurgerIcon
    var content : Content
    
    @State var hasIcon : Bool = true
    @State var isDragable : Bool = true
    
    var hamburgerTopPadding : CGFloat = 20
    var hamburgerLeadingPadding : CGFloat = 20
    
    var mainPagePaddingVertical : CGFloat = 20
    var mainPagePaddingTrailing : CGFloat = 20
    
    var drawerPaddingVertical : CGFloat = 20
    var drawerPaddingHorizontal : CGFloat = 20
    
    var drawerStyle : DrawerStyle = .fullScreenDrawer
    
    @State var isDrawerOn : Bool = false
    @State var screenWidth : CGFloat = 0
    
    public init(
        _ drawerStyle : DrawerStyle = .fullScreenDrawer ,
        isArabic : Bool = false,
        selection : Binding<Int> ,
        hamburgerTopPadding : CGFloat = 20,
        hamburgerLeadingPadding : CGFloat = 20,
        mainPagePaddingVertical : CGFloat = 20,
        mainPagePaddingTrailing : CGFloat = 20,
        
        drawerPaddingVertical:CGFloat = 20,
        drawerPaddingHorizontal:CGFloat = 20,
        
        @ViewBuilder content : ()-> Content,
        @ViewBuilder burgerIcon : ()-> BurgerIcon,
        @ViewBuilder background: ()-> Background,
        @ViewBuilder drawerBackground: ()-> DrawerBackground,
        @ViewBuilder drawerHeader: ()-> DrawerHeader,
        @ViewBuilder drawerFooter: ()-> DrawerFooter,
        itemView: @escaping (DrawerItem)-> ItemView
    ) {
        self._selection = selection
        self.isArabic = isArabic
        self.itemView = itemView
        self.background = background()
        self.drawerBackground = drawerBackground()
        self.drawerHeader = drawerHeader()
        self.drawerFooter = drawerFooter()
        
        self.mainPagePaddingVertical = mainPagePaddingVertical
        self.mainPagePaddingTrailing = mainPagePaddingTrailing
        
        self.drawerPaddingVertical = drawerPaddingVertical
        self.drawerPaddingHorizontal = drawerPaddingHorizontal

        self.drawerStyle = drawerStyle
       
        self.hamburgerTopPadding = hamburgerTopPadding
        self.hamburgerLeadingPadding = hamburgerLeadingPadding
        
        self.content = content()
        self.burgerIcon = burgerIcon()
    }
    
    public var body: some View {
        ZStack {
            GeometryReader { geo in
                Text("")
                    .opacity(setWidth(geo))
            }
            background
                .ignoresSafeArea()
            if(drawerStyle == .mainNotDraggable) {
                if ( isDrawerOn ) {
                    pageView
                        .ignoresSafeArea()
                    BlurView()
                        .ignoresSafeArea()
                    drawerView
                        .ignoresSafeArea()
                } else {
                    drawerView
                        .ignoresSafeArea()
                    pageView
                        .ignoresSafeArea()
                }
            } else {
                drawerView
                    .ignoresSafeArea()
                pageView
                    .ignoresSafeArea()
            }
            
        }
        .onAppear(perform: {
            screenWidth = getScreenWidth()
        })
        .ignoresSafeArea()
        .onPreferenceChange(DrawerItemsPreferenceKey.self) { items in
            self.tabs = items
        }
    }
    
    func setWidth(_ geo:GeometryProxy) -> CGFloat {
        screenWidth = geo.frame(in: .global).width
        return 1
    }
    
    var pageView : some View {
        ZStack {
            content
                .edgesIgnoringSafeArea(.all)
                .onPreferenceChange(DrawerHasIconPreferenceKey.self) { val in
                    self.hasIcon = val
                }
                .onPreferenceChange(DrawerIsDragablePreferenceKey.self) { val in
                    self.isDragable = val
                }
            if(hasIcon){
                burgerIcon
                    .padding(.top, hamburgerTopPadding)
                    .padding(.leading, hamburgerLeadingPadding)
                    .frame(maxHeight: .infinity , alignment: .top)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .onTapGesture {
                        withAnimation {
                            isDrawerOn.toggle()
                        }
                    }
            }
        }
//        .rotation3DEffect(
//            Angle(degrees: isDrawerOn ? 25 : 0)
//            , axis: (x: 0.0, y: 0.25, z: 0.0)
//            , anchor: .center
//            , anchorZ: 0
//            , perspective: 0
//        )
        .offset(x: drawerStyle == .mainNotDraggable ? 0 : screenWidth * getMainOffset())
        .frame(maxWidth: .infinity , alignment: .trailing)
        .padding(.vertical , getVerticalPadding())
        .padding(.trailing , getTrailingPadding())
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if(isDragable) {
                        withAnimation {
                            if(isArabic) {
                                isDrawerOn = value.translation.width < 0
                            } else {
                                isDrawerOn = value.translation.width > 0
                            }
                            
                        }
                    }
                })
        )
    }
    
    func getVerticalPadding() -> CGFloat {
        var padding = 0.0
        if(drawerStyle == .mainWithPadding) {
            if(isDrawerOn) {
                padding = mainPagePaddingVertical
            }
        }
        return padding
    }
    
    func getTrailingPadding() -> CGFloat {
        var padding = 0.0
        if(drawerStyle == .mainWithPadding) {
            if(isDrawerOn) {
                padding = mainPagePaddingTrailing
            }
        }
        return padding
    }
    
    func getMainOffset() -> CGFloat {
        var offset = 1.0
        if (isDrawerOn) {
            if(drawerStyle == .fullScreenDrawer) {
                offset = 1
            } else if(drawerStyle == .halfScreen) {
                offset = 0.5
            } else if(drawerStyle == .oneQuarter) {
                offset = 0.25
            } else {
                offset = 0.7
            }
        } else {
            offset = 0
        }
        return offset
    }
    
    var drawerView : some View {
        DrawerPage(
            tabs: tabs,
            selection: $selection,
            isDrawerOn: $isDrawerOn,
            paddingVertical:drawerPaddingVertical,
            paddingHorizontal:drawerPaddingHorizontal) { item in
                itemView(item)
            } background: {
                drawerBackground
            } header: {
                drawerHeader
            } footer: {
                drawerFooter
            }
        .frame(width: screenWidth * getMainOffset())
        .frame(maxWidth: .infinity , alignment: .leading)
        .gesture(
            DragGesture()
                .onEnded(onDrawerDragEnded(_:))
        )
    }
    
    func onDrawerDragEnded(_ value : DragGesture.Value){
        var shouldClose = false
        if(isArabic) {
            shouldClose = value.translation.width > 0
        } else {
            shouldClose = value.translation.width < 0
        }
        if(shouldClose) {
            if(isDragable) {
                withAnimation {
                    isDrawerOn = false
                }
            }
        }
    }
    
    public func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
    public func getScreenWidth()-> CGFloat {
        return getScreenSize().width
    }
    
    public func getScreenHeight()-> CGFloat {
        return getScreenSize().height
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        DrawerExample()
    }
}

public enum DrawerStyle {
    case fullScreenDrawer
    case halfScreen
    case threeQuarters
    case oneQuarter
    case mainWithPadding
    case mainNotDraggable
}
