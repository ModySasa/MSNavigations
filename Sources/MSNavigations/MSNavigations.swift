//
//  MSNavigations.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import SwiftUI

public class MSNavigations {
    public let colors: NavigationColors
    public let sizes: NavigationSizes
    public let shouldSwipeBack: Bool
    
    // Private initializer to prevent direct instantiation
    private init(colors: NavigationColors , sizes : NavigationSizes , shouldSwipeBack : Bool = true) {
        self.colors = colors
        self.sizes = sizes
        self.shouldSwipeBack = shouldSwipeBack
    }
    
    // Static property to hold the singleton instance
    private static var instance: MSNavigations?
    
    // Method to initialize the singleton instance
    public static func initialize(colors: NavigationColors , sizees : NavigationSizes , shouldSwipeBack : Bool = true) {
        guard instance == nil else {
            fatalError("MSNavigations has already been initialized.")
            return
        }
        instance = MSNavigations(colors: colors , sizes: sizees , shouldSwipeBack: shouldSwipeBack)
    }
    
    // Accessor to retrieve the singleton instance
    public static var shared: MSNavigations {
        guard let instance = instance else {
            fatalError("MSNavigations has not been initialized. Call initialize(colors:) first.")
        }
        return instance
    }
    
    public static var hasTopNotch: Bool {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        return keyWindow?.safeAreaInsets.top ?? 0 > 20
    }
}
