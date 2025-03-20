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
            ZStack{
                if(stacksViewModel.lastItem != nil){
                    NavigationLink(
                        destination:
                            CustomNavBarContainerView(backgroundColor , textStyleModifier: TextMod()) {
                                destination
                                    .ignoresSafeArea()
                                    .navigationBarHidden(true)
                            }
                        , tag: stacksViewModel.lastItemTag ?? "", selection: $stacksViewModel.lastItemTag) { EmptyView() }
                }
                CustomNavBarContainerView(backgroundColor , textStyleModifier: TextMod()) {
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
