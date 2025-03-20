//
//  CustomNavStack15.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import SwiftUI

public struct CustomNavStack15<Destination : View , Content:View>: View {
    var content : Content
    var destination : Destination
    
    @EnvironmentObject var stacksViewModel : OldStackViewModel
    var backgroundColor : Color = MSNavigations.shared.colors.backgroundColor
    
    public init(
        backgroundColor : Color = MSNavigations.shared.colors.backgroundColor,
        @ViewBuilder content:()->Content,
        @ViewBuilder destination:()->Destination
    ) {
        self.content = content()
        self.destination = destination()
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        NavigationView {
            CustomNavBarContainerView(backgroundColor , textStyleModifier: UndoPaddingMod()) {
                ZStack{
                    if(stacksViewModel.lastItem != nil){
                        NavigationLink(
                            destination:
                                destination
                                .ignoresSafeArea()
                                .navigationBarHidden(true)
                                .navigationViewStyle(.stack)
                            
                            , tag: stacksViewModel.lastItemTag ?? "", selection: $stacksViewModel.lastItemTag) { EmptyView() }
                    }
                    content
                        .ignoresSafeArea()
                        .navigationBarHidden(true)
                        .navigationViewStyle(.stack)
                }
            }
        }
    }
}

struct TextMod : ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title)
    }
}

struct UndoPaddingMod: ViewModifier {
    public func body(content:Content) -> some View {
        content
            .padding(-10)
    }
}
