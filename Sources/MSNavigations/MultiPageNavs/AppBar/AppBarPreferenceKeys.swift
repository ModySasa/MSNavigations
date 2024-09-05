//
//  File.swift
//
//
//  Created by Corptia 02 on 11/04/2023.
//

import Foundation
import SwiftUI

public struct AppBarTitlePreKeys : PreferenceKey {
    public static var defaultValue: String = ""
    
    public static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

public struct AppBarTitleStylePreKeys : PreferenceKey {
    public static var defaultValue: AppBarTitleStyle = .Center
    
    public static func reduce(value: inout AppBarTitleStyle, nextValue: () -> AppBarTitleStyle) {
        value = nextValue()
    }
}

public struct HasAppBarPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasAppBarLeadingFirstViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasAppBarLeadingSecondViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasAppBarTrailingFirstViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasAppBarTrailingSecondViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct AppBarHasBackButtonPrefKey : PreferenceKey {
    public static var defaultValue: Bool = true
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct AppBarBackButtonViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct AppBarBackgroundViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct AppBarLeadingFirstViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct AppBarLeadingSecondViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct AppBarTrailingFirstViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct AppBarTrailingSecondViewPrefKey : PreferenceKey {
    public static var defaultValue: EquatableViewContainer = EquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout EquatableViewContainer, nextValue: () -> EquatableViewContainer) {
        value = nextValue()
    }
}

public struct DialogViewPrefKey : PreferenceKey {
    public static var defaultValue: DialogEquatableViewContainer = DialogEquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout DialogEquatableViewContainer, nextValue: () -> DialogEquatableViewContainer) {
        value = nextValue()
    }
}

public struct LoadingViewPrefKey : PreferenceKey {
    public static var defaultValue: LoadingViewEquatableViewContainer = LoadingViewEquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout LoadingViewEquatableViewContainer, nextValue: () -> LoadingViewEquatableViewContainer) {
        value = nextValue()
    }
}

public struct MenuViewPrefKey : PreferenceKey {
    public static var defaultValue: MenuViewEquatableViewContainer = MenuViewEquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout MenuViewEquatableViewContainer, nextValue: () -> MenuViewEquatableViewContainer) {
        value = nextValue()
    }
}

public struct ToastViewPrefKey : PreferenceKey {
    public static var defaultValue: ToastViewEquatableViewContainer = ToastViewEquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout ToastViewEquatableViewContainer, nextValue: () -> ToastViewEquatableViewContainer) {
        value = nextValue()
    }
}


public struct HasDialogViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = false
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct IsLoadingViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = false
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasMenuViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = false
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct HasToastViewPrefKey : PreferenceKey {
    public static var defaultValue: Bool = false
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct AppBarTitleFontWeightPreKeys : PreferenceKey {
    public static var defaultValue: Font.Weight = .bold
    
    public static func reduce(value: inout Font.Weight, nextValue: () -> Font.Weight) {
        value = nextValue()
    }
}

public struct AppBarTitleFontSizePreKeys : PreferenceKey {
    public static var defaultValue: CGFloat = MSNavigations.shared.sizes.header
    
    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct AppBarTitleColorPreKeys : PreferenceKey {
    public static var defaultValue: Color = MSNavigations.shared.colors.barTextColor
    
    public static func reduce(value: inout Color, nextValue: () -> Color) {
        value = nextValue()
    }
}

public extension View {
    
    func customAppBarTitle(_ title:String = "") -> some View {
        preference(key: AppBarTitlePreKeys.self, value: title)
    }
    
    func customAppBarTitleStyle(_ titleStyle:AppBarTitleStyle = .Center) -> some View {
        preference(key: AppBarTitleStylePreKeys.self, value: titleStyle)
    }
    
    func customAppBarTitleFontWeight(_ titleStyle:Font.Weight = .bold) -> some View {
        preference(key: AppBarTitleFontWeightPreKeys.self, value: titleStyle)
    }
    
    func customAppBarTitleFontSize(_ titleSize:CGFloat = MSNavigations.shared.sizes.header) -> some View {
        preference(key: AppBarTitleFontSizePreKeys.self, value: titleSize)
    }
    
    func customAppBarTitleColor(_ titleColor:Color = MSNavigations.shared.colors.barTextColor) -> some View {
        preference(key: AppBarTitleColorPreKeys.self, value: titleColor)
    }
    
    func hasCustomAppBar(_ hasBar:Bool) -> some View {
        preference(key: HasAppBarPrefKey.self, value: hasBar)
    }
    
    func customAppBarHasBack(_ hasBack:Bool) -> some View {
        preference(key: AppBarHasBackButtonPrefKey.self, value: hasBack)
    }
    
    func hasCustomAppBarLeadingFirstView(_ hasView:Bool) -> some View {
        preference(key: HasAppBarLeadingFirstViewPrefKey.self, value: hasView)
    }
    
    func hasCustomAppBarLeadingSecondView(_ hasView:Bool) -> some View {
        preference(key: HasAppBarLeadingSecondViewPrefKey.self, value: hasView)
    }
    
    func hasCustomAppBarTrailingFirstView(_ hasView:Bool) -> some View {
        preference(key: HasAppBarTrailingFirstViewPrefKey.self, value: hasView)
    }
    
    func hasCustomAppBarTrailingSecondView(_ hasView:Bool) -> some View {
        preference(key: HasAppBarTrailingSecondViewPrefKey.self, value: hasView)
    }
    
    func customAppBarBackgroundView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarBackgroundViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
    }
    
    func customAppBarBackButtonView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarBackButtonViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
    }
    
    func customAppBarLeadingFirstView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarLeadingFirstViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
            .hasCustomAppBarLeadingFirstView(true)
    }
    
    func customAppBarLeadingSecondView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarLeadingSecondViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
            .hasCustomAppBarLeadingSecondView(true)
    }
    
    func customAppBarTrailingFirstView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarTrailingFirstViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
            .hasCustomAppBarTrailingFirstView(true)
    }
    
    func customAppBarTrailingSecondView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: AppBarTrailingSecondViewPrefKey.self, value: EquatableViewContainer(view: AnyView(view())))
            .hasCustomAppBarTrailingSecondView(true)
    }
    
    func dialogView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: DialogViewPrefKey.self, value: DialogEquatableViewContainer(view: AnyView(view())))
    }
    
    func loadingView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: LoadingViewPrefKey.self, value: LoadingViewEquatableViewContainer(view: AnyView(view())))
    }
    
    func toastView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: ToastViewPrefKey.self, value: ToastViewEquatableViewContainer(view: AnyView(view())))
    }
    
    func hasDialogView(_ hasDialog:Bool) -> some View {
        preference(key: HasDialogViewPrefKey.self, value: hasDialog)
    }
    
    func isLoading(_ isLoading:Bool) -> some View {
        preference(key: IsLoadingViewPrefKey.self, value: isLoading)
    }
    
    func hasMenu(_ hasMenu:Bool) -> some View {
        preference(key: HasMenuViewPrefKey.self, value: hasMenu)
    }
    
    func hasToast(_ hasToast:Bool) -> some View {
        preference(key: HasToastViewPrefKey.self, value: hasToast)
    }
    
    func setCustomAppBar(
        title:String = "" ,
        titleStyle : AppBarTitleStyle = .Center ,
        hasBack:Bool = true,
        fontWeight:Font.Weight = .bold,
        fontSize:CGFloat = MSNavigations.shared.sizes.header,
        fontColor:Color = MSNavigations.shared.colors.barTextColor
    ) -> some View {
        self.hasCustomAppBar(true)
            .customAppBarTitle(title)
            .customAppBarHasBack(hasBack)
            .customAppBarTitleStyle(titleStyle)
            .customAppBarTitleFontWeight(fontWeight)
            .customAppBarTitleFontSize(fontSize)
            .customAppBarTitleColor(fontColor)
        
    }
    
}

public enum AppBarTitleStyle {
    case Center
    case BesideBack
    case Notitle
}

//MARK: to be able to pass a view through preference keys
public struct EquatableViewContainer: Equatable {
    public let id = UUID().uuidString
    public let view:AnyView
    public init(view:AnyView) {
        self.view = view
    }
    public static func == (lhs: EquatableViewContainer, rhs: EquatableViewContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
}

public struct DialogEquatableViewContainer: Equatable {
    public let id = UUID().uuidString
    public let view:AnyView
    public init(view:AnyView) {
        self.view = view
    }
    public static func == (lhs: DialogEquatableViewContainer, rhs: DialogEquatableViewContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
}


public struct LoadingViewEquatableViewContainer: Equatable {
    public let id = UUID().uuidString
    public let view:AnyView
    public init(view:AnyView) {
        self.view = view
    }
    public static func == (lhs: LoadingViewEquatableViewContainer, rhs: LoadingViewEquatableViewContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
}

public struct MenuViewEquatableViewContainer: Equatable {
    public let id = UUID().uuidString
    public let view:AnyView
    public init(view:AnyView) {
        self.view = view
    }
    public static func == (lhs: MenuViewEquatableViewContainer, rhs: MenuViewEquatableViewContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
}

public struct ToastViewEquatableViewContainer: Equatable {
    public let id = UUID().uuidString
    public let view:AnyView
    
    public init(view:AnyView) {
        self.view = view
    }
    
    public static func == (lhs: ToastViewEquatableViewContainer, rhs: ToastViewEquatableViewContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
}

public struct DialogModifier<Dialog:View> : ViewModifier {
    var dialog : Dialog
    @Binding var showDialog : Bool
    
    public init(_ showDialog:Binding<Bool> , @ViewBuilder dialog : ()->Dialog) {
        self.dialog = dialog()
        self._showDialog = showDialog
    }
    
    public func body(content:Content) -> some View {
        content
            .hasDialogView(showDialog)
            .dialogView{
                dialog
            }
    }
}

public struct LoadingViewModifier<LoadingView:View> : ViewModifier {
    var loadingView : LoadingView
    @Binding var isLoading : Bool
    
    public init(_ isLoading:Binding<Bool> , @ViewBuilder loadingView : ()->LoadingView) {
        self.loadingView = loadingView()
        self._isLoading = isLoading
    }
    
    public func body(content:Content) -> some View {
        content
            .isLoading(isLoading)
            .loadingView {
                loadingView
            }
    }
}

public struct ToastViewModifier<ToastViewHere:View> : ViewModifier {
    var toastView : ToastViewHere
    @Binding var hasToast : Bool
    
    public init(_ hasToast:Binding<Bool> , @ViewBuilder toastView : ()->ToastViewHere) {
        self.toastView = toastView()
        self._hasToast = hasToast
    }
    
    public func body(content:Content) -> some View {
        content
            .hasToast(hasToast)
            .toastView {
                toastView
            }
    }
}

public extension View {
    func initDialogWithAppBar<V:View>(_ showDialog:Binding<Bool> , view: ()->V) -> some View {
        modifier(DialogModifier(showDialog, dialog: view))
    }
    
    func initLoadingViewWithAppBar<V:View>(_ isLoading:Binding<Bool> , view: ()->V) -> some View {
        modifier(LoadingViewModifier(isLoading, loadingView: view))
    }
    
    func initToastViewWithAppBar<V:View>(_ isLoading:Binding<Bool> , view: ()->V) -> some View {
        modifier(ToastViewModifier(isLoading, toastView: view))
    }
}


//public struct EquatableBinder: Equatable {
//    let id = UUID().uuidString
//    let bindier:Binding<Bool>
//
//    public static func == (lhs: EquatableBinder, rhs: EquatableBinder) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//}
