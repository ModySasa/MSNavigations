//
//  NavigationSizes.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import Foundation

public struct NavigationSizes {
    public let header: CGFloat
    public let headerLineSpacing: CGFloat
    public let headerMonoSpacing: CGFloat
    
    public let mainMarginTop: CGFloat
    public let backBarPaddingBottom: CGFloat
    public let backBarPaddingLeading: CGFloat
    public let appBarHeight: CGFloat

    public let tabBarHeight: CGFloat
    public let tabBarHorizontalPadding: CGFloat
    public let tabBarBottomPadding: CGFloat
    
    public init(
        header: CGFloat, headerLineSpacing: CGFloat, headerMonoSpacing: CGFloat
        , mainMarginTop: CGFloat, backBarPaddingBottom: CGFloat, backBarPaddingLeading: CGFloat, appBarHeight: CGFloat
        , tabBarHeight:CGFloat , tabBarHorizontalPadding: CGFloat , tabBarBottomPadding: CGFloat
    ) {
        self.header = header
        self.headerLineSpacing = headerLineSpacing
        self.headerMonoSpacing = headerMonoSpacing
        
        self.mainMarginTop = mainMarginTop
        self.backBarPaddingBottom = backBarPaddingBottom
        self.backBarPaddingLeading = backBarPaddingLeading
        self.appBarHeight = appBarHeight
        
        self.tabBarHeight = tabBarHeight
        self.tabBarHorizontalPadding = tabBarHorizontalPadding
        self.tabBarBottomPadding = tabBarBottomPadding
    }
}
