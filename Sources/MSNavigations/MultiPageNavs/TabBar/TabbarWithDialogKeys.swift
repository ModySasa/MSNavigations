//
//  TabbarWithDialogKeys.swift
//  
//
//  Created by Corptia 02 on 31/05/2023.
//

import Foundation
import SwiftUI

//MARK: IF the page contains both APP BAR and TAB VIEW , to fix the problem with the dialog
public struct TabBarHasDialogBarPrefKey:PreferenceKey {
    public static var defaultValue: Bool = false
    
    public static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct TabBarDialogViewPrefKey : PreferenceKey {
    public static var defaultValue: DialogEquatableViewContainer = DialogEquatableViewContainer(view: AnyView(EmptyView()) )
    
    public static func reduce(value: inout DialogEquatableViewContainer, nextValue: () -> DialogEquatableViewContainer) {
        value = nextValue()
    }
}

public extension View {
    func setTabBarWithDialog(_ hasDialog:Bool) -> some View{
        preference(key: TabBarHasDialogBarPrefKey.self, value: hasDialog)
    }
    
    func setTabBarsDialogView<V: View>(@ViewBuilder _ view: ()->V) -> some View {
        preference(key: TabBarDialogViewPrefKey.self, value: DialogEquatableViewContainer(view: AnyView(view())))
    }
    
    func initTabBarDialogForAppBar<V:View>(_ showDialog:Binding<Bool> , view: ()->V) -> some View {
        modifier(DialogWithTabBarModifier(showDialog, dialog: view))
    }
}

public struct DialogWithTabBarModifier<Dialog:View> : ViewModifier {
    var dialog : Dialog
    @Binding var showDialog : Bool
    
    public init(_ showDialog:Binding<Bool> , @ViewBuilder dialog : ()->Dialog) {
        self.dialog = dialog()
        self._showDialog = showDialog
    }
    
    public func body(content:Content) -> some View {
        content
            .setTabBarWithDialog(showDialog)
            .setTabBarsDialogView {
                dialog
            }
    }
    
}
