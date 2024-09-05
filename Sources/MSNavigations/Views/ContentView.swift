//
//  ContentView.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import SwiftUI

public struct ContentView<Content16:View , Content15:View>: View {
    var content15: Content15
    var content16: Content16
    
    public init(@ViewBuilder content15:()->Content15 , @ViewBuilder content16: ()->Content16) {
        self.content15 = content15()
        self.content16 = content16()
    }
    
    public var body: some View {
        if #available(iOS 16.0, *) {
            content16
        } else {
            content15
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView {
            Text("15")
        } content16: {
            Text("16")
        }
    }
}
