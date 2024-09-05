//
//  CustomNavStack16.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import SwiftUI

@available(iOS 16.0, *)
public struct CustomNavStack16<Content:View>: View {
    var content : Content
    @EnvironmentObject var stacksViewModel : MyStackViewModel
    
    var backgroundColor : Color = MSNavigations.shared.colors.backgroundColor
    
    public init(backgroundColor : Color = MSNavigations.shared.colors.backgroundColor, @ViewBuilder content:()->Content) {
        self.content = content()
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        NavigationStack(path: $stacksViewModel.presentedItems){
            content
            .ignoresSafeArea()
            .toolbar(.hidden, for: .navigationBar)
//            .initKeyboardToolbar()
        }
    }
}
