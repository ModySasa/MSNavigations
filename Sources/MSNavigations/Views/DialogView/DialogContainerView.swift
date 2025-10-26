//
//  DialogContainerView.swift
//  MSNavigations
//
//  Created by Moha on 10/20/25.
//

import SwiftUI

public struct DialogContainerView<Dialog : View>: ViewModifier {
    var showDialog: Binding<Bool>
    let dialogView: () -> Dialog
    
    public init(
        showDialog: Binding<Bool>,
        @ViewBuilder dialogView: @escaping () -> Dialog
    ) {
        self.showDialog = showDialog
        self.dialogView = dialogView
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if showDialog.wrappedValue {
                dialogView()
            }
        }
    }
}

public extension View {
    func dialogContainer<Dialog: View>(
        showDialog: Binding<Bool>,
        @ViewBuilder dialogView: @escaping () -> Dialog
    ) -> some View {
        modifier(DialogContainerView(showDialog: showDialog, dialogView: dialogView))
    }
}

@available(iOS 17.0, *)
@Observable
public class DialogManager {
    public var showDialog = false
    public var dialogView : AnyView = AnyView(EmptyView())
    
    public init(showDialog: Bool = false, dialogView: AnyView = AnyView(EmptyView())) {
        self.showDialog = showDialog
        self.dialogView = dialogView
    }
    
    public func show<V:View>(dialogView: ()->V) {
        showDialog = true
        self.dialogView = AnyView(dialogView())
    }
    
    public func hide(){
        showDialog = false
        self.dialogView = AnyView(EmptyView())
    }
}

public class ObservableDialogManager : ObservableObject {
    @Published public var showDialog = false
    @Published public var dialogView : AnyView = AnyView(EmptyView())
    
    public init(showDialog: Bool = false, dialogView: AnyView = AnyView(EmptyView())) {
        self.showDialog = showDialog
        self.dialogView = dialogView
    }
    
    public func show<V:View>(dialogView: ()->V) {
        showDialog = true
        self.dialogView = AnyView(dialogView())
    }
    
    public func hide(){
        showDialog = false
        self.dialogView = AnyView(EmptyView())
    }
}
