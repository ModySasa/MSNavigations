//
//  CustomNavBarContainerView.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import SwiftUI

public struct CustomNavBarContainerView<Content:View , TextStyleModifier : ViewModifier>: View {
    let content : Content
    let textStyleModifier : TextStyleModifier?
    @State var pageTitle : String = ""
    @State var hasBackButton : Bool = true
    @State var hasAppBar : Bool = true
    @State var hasDialog : Bool = false
    @State var isLoading : Bool = false
    @State var hasMenu : Bool = false
    @State var hasToast : Bool = false
    @State var appBarTitleStyle : AppBarTitleStyle = .Center
    @State var appBarFontWeight : Font.Weight = .bold
    @State var appBarFontSize : CGFloat = MSNavigations.shared.sizes.header
    @State var titleColor : Color = MSNavigations.shared.colors.barTextColor
    
    @State var barHasLeadingFirstView : Bool = true
    @State var barHasLeadingSecondView : Bool = true
    @State var barHasTrailingFirstView : Bool = true
    @State var barHasTrailingSecondView : Bool = true
    
    @State var appBarBackButtonView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    @State var appBarBackgroundView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    @State var appBarLeadingFirstView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    @State var appBarLeadingSecondView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    
    @State var appBarTrailingFirstView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    @State var appBarTrailingSecondView : EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()))
    
    var backgroundColor : Color = MSNavigations.shared.colors.backgroundColor
    
    
    
    @State var dialog : DialogEquatableViewContainer = DialogEquatableViewContainer(view: AnyView(EmptyView()))
    
    @State var loadingView : LoadingViewEquatableViewContainer = LoadingViewEquatableViewContainer(view: AnyView(EmptyView()))
    
    @State var menuView : MenuViewEquatableViewContainer = MenuViewEquatableViewContainer(view: AnyView(EmptyView()))

    @State var toastView : ToastViewEquatableViewContainer = ToastViewEquatableViewContainer(view: AnyView(EmptyView()))
    
    var onDismiss : (()-> Void)?
    
    public init(
        _ backgroundColor : Color = MSNavigations.shared.colors.backgroundColor ,
        textStyleModifier : TextStyleModifier? = nil ,
        @ViewBuilder content: ()-> Content,
        onDismiss : (()-> Void)? = nil
    ) {
        self.content = content()
        self.backgroundColor = backgroundColor
        self.textStyleModifier = textStyleModifier
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            VStack(spacing: MSNavigations.shared.sizes.mainMarginTop) {
                if(hasAppBar){
                    CustomAppBar(
                        pageTitle: pageTitle,
                        titleStyle: appBarTitleStyle,
                        hasBackButton: hasBackButton,
                        appBarFontWeight: appBarFontWeight,
                        appBarFontSize: appBarFontSize,
                        titleColor: titleColor,
                        hasLeadingViewFirst: barHasLeadingFirstView,
                        hasLeadingViewSecond: barHasLeadingSecondView,
                        hasTrailingViewFirst: barHasTrailingFirstView,
                        hasTrailingViewSecond: barHasTrailingSecondView, textStyleModifier: textStyleModifier
                    ) {
                        appBarBackgroundView.view
                    } backButtonView : {
                        appBarBackButtonView.view
                    } leadingViewFirst: {
                        appBarLeadingFirstView.view
                    } leadingViewSecond: {
                        appBarLeadingSecondView.view
                    } trailingViewFirst: {
                        appBarTrailingFirstView.view
                    } trailingViewSecond: {
                        appBarTrailingSecondView.view
                    } onDismiss : {
                        if let onDismiss {
                            onDismiss()
                        }
                    }
                }
                content
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .onPreferenceChange(DialogViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            withAnimation {
                                self.dialog = value
                            }
                        }
                    }
                    .onPreferenceChange(LoadingViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            withAnimation {
                                self.loadingView = value
                            }
                        }
                    }
                    .onPreferenceChange(MenuViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            withAnimation {
                                self.menuView = value
                            }
                        }
                    }
                    .onPreferenceChange(HasDialogViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            self.hasDialog = value
                        }
                    }
                    .onPreferenceChange(IsLoadingViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            self.isLoading = value
                        }
                    }
                    .onPreferenceChange(HasMenuViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            self.hasMenu = value
                        }
                    }
                    .onPreferenceChange(HasToastViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            withAnimation {
                                self.hasToast = value
                            }
                        }
                    }
                    .onPreferenceChange(ToastViewPrefKey.self) { value in
                        DispatchQueue.main.async {
                            withAnimation {
                                self.toastView = value
                            }
                        }
                    }
            }
            .ignoresSafeArea()
            if(hasDialog) {
                dialog.view
                    .frame(maxWidth: .infinity , maxHeight:.infinity , alignment:.center)
                    .ignoresSafeArea()
                    .onAppear {
                        print("TEST THE DIALOG \(hasAppBar)")
                    }
            }
            if(isLoading) {
                loadingView.view
                    .frame(maxWidth: .infinity , maxHeight:.infinity , alignment:.center)
                    .ignoresSafeArea()
            }
            if(hasMenu) {
                menuView.view
                    .frame(maxWidth: .infinity , maxHeight:.infinity , alignment:.center)
                    .ignoresSafeArea()
            }
//            if(hasToast) {
//                toastView.view
//                    .frame(maxWidth: .infinity , maxHeight:.infinity , alignment:.center)
//                    .ignoresSafeArea()
//            }
        }
        .onPreferenceChange(AppBarTitlePreKeys.self) { value in
            self.pageTitle = value
        }
        .onPreferenceChange(HasAppBarPrefKey.self) { value in
            self.hasAppBar = value
        }
        .onPreferenceChange(AppBarHasBackButtonPrefKey.self) { value in
            self.hasBackButton = value
        }
        .onPreferenceChange(HasAppBarLeadingFirstViewPrefKey.self) { value in
            self.barHasLeadingFirstView = value
        }
        .onPreferenceChange(HasAppBarLeadingSecondViewPrefKey.self) { value in
            self.barHasLeadingSecondView = value
        }
        .onPreferenceChange(HasAppBarTrailingFirstViewPrefKey.self) { value in
            self.barHasTrailingFirstView = value
        }
        .onPreferenceChange(HasAppBarTrailingSecondViewPrefKey.self) { value in
            self.barHasTrailingSecondView = value
        }
        .onPreferenceChange(AppBarBackgroundViewPrefKey.self) { value in
            self.appBarBackgroundView = value
        }
        .onPreferenceChange(AppBarBackButtonViewPrefKey.self) { value in
            self.appBarBackButtonView = value
        }
        .onPreferenceChange(AppBarLeadingFirstViewPrefKey.self) { value in
            self.appBarLeadingFirstView = value
        }
        .onPreferenceChange(AppBarLeadingSecondViewPrefKey.self) { value in
            self.appBarLeadingSecondView = value
        }
        .onPreferenceChange(AppBarTrailingFirstViewPrefKey.self) { value in
            self.appBarTrailingFirstView = value
        }
        .onPreferenceChange(AppBarTrailingSecondViewPrefKey.self) { value in
            self.appBarTrailingSecondView = value
        }
        .onPreferenceChange(AppBarTitleStylePreKeys.self) { value in
            self.appBarTitleStyle = value
        }
        .onPreferenceChange(AppBarTitleFontWeightPreKeys.self) { value in
            self.appBarFontWeight = value
        }
        .onPreferenceChange(AppBarTitleFontSizePreKeys.self) { value in
            self.appBarFontSize = value
        }
        .onPreferenceChange(AppBarTitleColorPreKeys.self) { value in
            self.titleColor = value
        }
    }
    
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView (
            textStyleModifier:AnyMod()
        ){
            ZStack{
                Color.red.ignoresSafeArea()
                Text("Not here")
            }
            .customAppBarTitleStyle(.Center)
            .customAppBarBackButtonView {
                Image(systemName: "chevron.left")
                    .tint(.white)
            }
            .customAppBarBackgroundView {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.brown)
            }
            .customAppBarLeadingFirstView {
                Image(systemName: "heart.fill")
                    .foregroundColor(.green)
                    .onTapGesture {
                        print("I am clicked leading first")
                    }
            }
            .customAppBarLeadingSecondView {
                Image(systemName: "person")
                    .foregroundColor(.green)
                    .onTapGesture {
                        print("I am clicked leading second")
                    }
            }
            .customAppBarTrailingFirstView {
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        print("I am clicked trailing first")
                    }
            }
            .customAppBarTrailingSecondView {
                Image(systemName: "person")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        print("I am clicked trailing second")
                    }
            }
            .setCustomAppBar(title: "SignUp", hasBack: true)
        }
    }
}
