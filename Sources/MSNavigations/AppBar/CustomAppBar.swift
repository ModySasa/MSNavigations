//
//  CustomAppBar.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import SwiftUI

public struct CustomAppBar<
    Content:View,
    BackButtonView:View,
    LeadingFirstView : View,
    LeadingSecondView : View,
    TrailingFirstView : View,
    TrailingSecondView : View,
    TextStyleModifier : ViewModifier
>: View {
    var background:Content
    
    var leadingViewFirst:LeadingFirstView
    var backButtonView:BackButtonView
    var appBarFontWeight:Font.Weight
    var appBarFontSize:CGFloat
    var titleColor:Color = MSNavigations.shared.colors.barTextColor
    var leadingViewSecond:LeadingSecondView
    var trailingViewFirst:TrailingFirstView
    var trailingViewSecond:TrailingSecondView
    
    var hasLeadingViewFirst : Bool = false
    var hasLeadingViewSecond : Bool = false
    var hasTrailingViewFirst : Bool = false
    var hasTrailingViewSecond : Bool = false
    
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) var isPresented
    
    var titleStyle : AppBarTitleStyle = .Center
    let pageTitle : String
    let hasBackButton : Bool
    let textStyleModifier : TextStyleModifier
    
    init(
        pageTitle:String ,
        titleStyle : AppBarTitleStyle = .Center,
        hasBackButton : Bool = true,
        appBarFontWeight : Font.Weight = .bold,
        appBarFontSize : CGFloat = MSNavigations.shared.sizes.header,
        titleColor:Color = MSNavigations.shared.colors.barTextColor,
        hasLeadingViewFirst : Bool = false,
        hasLeadingViewSecond : Bool = false,
        hasTrailingViewFirst : Bool = false,
        hasTrailingViewSecond : Bool = false,
        textStyleModifier : TextStyleModifier,
        @ViewBuilder background : ()->Content,
        @ViewBuilder backButtonView : ()->BackButtonView,
        @ViewBuilder leadingViewFirst : ()->LeadingFirstView,
        @ViewBuilder leadingViewSecond : ()->LeadingSecondView,
        @ViewBuilder trailingViewFirst : ()->TrailingFirstView,
        @ViewBuilder trailingViewSecond : ()->TrailingSecondView
    ) {
        self.titleColor = titleColor
        self.pageTitle = pageTitle
        self.titleStyle = titleStyle
        self.hasBackButton = hasBackButton
        self.appBarFontWeight = appBarFontWeight
        self.appBarFontSize = appBarFontSize
        self.textStyleModifier = textStyleModifier
        
        self.hasLeadingViewFirst = hasLeadingViewFirst
        self.hasLeadingViewSecond = hasLeadingViewSecond
        self.hasTrailingViewFirst = hasTrailingViewFirst
        self.hasTrailingViewSecond = hasTrailingViewSecond
        
        self.background = background()
        self.backButtonView = backButtonView()
        self.leadingViewFirst = leadingViewFirst()
        self.leadingViewSecond = leadingViewSecond()
        self.trailingViewFirst = trailingViewFirst()
        self.trailingViewSecond = trailingViewSecond()
    }
    
    public var body: some View {
        ZStack{
            HStack(alignment: .center) {
                backButton
                leadingViewFirstViewBuilder()
                leadingViewSecondViewBuilder()
                if(titleStyle == .BesideBack) {
                    title
                }
                Spacer()
                trailingViewSecondViewBuilder()
                trailingViewFirstViewBuilder()
            }
            if(titleStyle == .Center) {
                title
            }
        }
        .padding(.bottom, MSNavigations.shared.sizes.backBarPaddingBottom)
        .ignoresSafeArea(edges: .top)
        .frame(height: MSNavigations.shared.sizes.appBarHeight , alignment: .bottom)
        .padding(.horizontal, MSNavigations.shared.sizes.backBarPaddingLeading)
        
        .background(
            background
        )
    }
    
    @ViewBuilder var title : some View {
        Text(pageTitle)
            .foregroundColor(titleColor)
            .modifier(textStyleModifier)
    }
    
    @ViewBuilder var backButton : some View {
        if(hasBackButton){
            Button {
                withAnimation(.easeOut) {
                        dismiss()
                }
            } label: {
                backButtonView
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func leadingViewFirstViewBuilder() -> some View {
        if(hasLeadingViewFirst) {
            leadingViewFirst
        }
    }
    
    @ViewBuilder func leadingViewSecondViewBuilder() -> some View {
        if(hasLeadingViewSecond) {
            leadingViewSecond
        }
    }
    
    @ViewBuilder func trailingViewFirstViewBuilder() -> some View {
        if(hasTrailingViewFirst) {
            trailingViewFirst
        }
    }
    
    @ViewBuilder func trailingViewSecondViewBuilder() -> some View {
        if(hasTrailingViewSecond) {
            trailingViewSecond
        }
    }
}

struct AnyMod : ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct CustomAppBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomAppBar(
            pageTitle: "Title",
            titleStyle : .Center,
            hasBackButton: true,
            hasLeadingViewFirst: true,
            hasLeadingViewSecond: true,
            hasTrailingViewFirst: true,
            hasTrailingViewSecond: true,
            textStyleModifier: AnyMod()
        ) {
            ZStack{
                MSNavigations.shared.colors.backgroundColor
                Image(systemName: "heart.fill")
                    .foregroundColor(.green)
            }
        } backButtonView: {
            Image(systemName: "chevron.left")
                .tint(.brown)
        } leadingViewFirst:{
            Image(systemName: "gear")
                .foregroundColor(.red)
        } leadingViewSecond: {
            Image(systemName: "person")
                .foregroundColor(.red)
        } trailingViewFirst: {
            Image(systemName: "gear")
                .foregroundColor(.yellow)
        } trailingViewSecond: {
            Image(systemName: "person")
                .foregroundColor(.yellow)
        }
    }
}
