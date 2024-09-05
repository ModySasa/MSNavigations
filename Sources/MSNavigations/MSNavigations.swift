//
//  MSNavigations.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


public class MSNavigations {
    public let colors: NavigationColors
    public let sizes: NavigationSizes
    
    // Private initializer to prevent direct instantiation
    private init(colors: NavigationColors , sizes : NavigationSizes) {
        self.colors = colors
        self.sizes = sizes
    }
    
    // Static property to hold the singleton instance
    private static var instance: MSNavigations?
    
    // Method to initialize the singleton instance
    public static func initialize(colors: NavigationColors , sizees : NavigationSizes) {
        guard instance == nil else {
//            fatalError("MSNavigations has already been initialized.")
            return
        }
        instance = MSNavigations(colors: colors , sizes: sizees)
    }
    
    // Accessor to retrieve the singleton instance
    public static var shared: MSNavigations {
        guard let instance = instance else {
            fatalError("MSNavigations has not been initialized. Call initialize(colors:) first.")
        }
        return instance
    }
}
