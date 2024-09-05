//
//  OldStackViewModel.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import Foundation

public class OldStackViewModel : ObservableObject  {
    
    public init() {
    }
    
    @Published public var lastItem : Any? = nil
    @Published public var lastItemTag : String? = nil
    
    //TODO: make an extension to the MyStackViewModel and copy the following methods but using your own destinations
    func moveTo(_ destination:MyStacks , drawerIndex : Int? = nil , bottomNavIndex : Int? = nil , shouldRestore : Bool? = nil){
        lastItem = destination
        lastItemTag = destination.rawValue
//        if let drawerIndex {
//            viewModel?.drawerIndex = drawerIndex
//        }
//        if let bottomNavIndex {
//            viewModel?.bottomNavIndex = bottomNavIndex
//        }
//        if let shouldRestore {
//            viewModel?.shouldRestore = shouldRestore
//        }
    }
}
