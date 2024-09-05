//
//  PreviewModifier.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import SwiftUI

struct PreviewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let initialColors = NavigationColors(
                    backgroundColor: .cyan
                    , barTextColor: .black
                    , btmNavSelectedTextColor: .gray
                    , btmNavUnSelectedTextColor: .black
                )
                let initialSizes = NavigationSizes(
                    header: 20
                    , headerLineSpacing: 15
                    , headerMonoSpacing: 10
                    , mainMarginTop: 15
                    , backBarPaddingBottom: 20
                    , backBarPaddingLeading: 20
                    , appBarHeight: 100
                    , tabBarHeight: 100
                    , tabBarHorizontalPadding: 10
                    , tabBarBottomPadding: 10
                )
                
                MSNavigations.initialize(colors: initialColors , sizees: initialSizes)
            }
    }
}

extension View {
    public func previewModifier() -> some View {
        self.modifier(PreviewModifier())
    }
}
