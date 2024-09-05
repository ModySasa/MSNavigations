//
//  BlurView.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import SwiftUI

public struct BlurView: View {
    public var color = Color.black
    public var opacity = 0.8
    
    public init(
        color: Color = Color.black
        , opacity: Double = 0.8
    ) {
        self.color = color
        self.opacity = opacity
    }
    public var body: some View {
        dimView
    }
    
    private var dimView: some View {
        color
            .opacity(opacity)
            .ignoresSafeArea()
        //            .opacity(backgroundOpacity)
    }
}
