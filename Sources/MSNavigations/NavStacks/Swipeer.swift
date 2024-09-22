//
//  Swipeer.swift
//  MSNavigations
//
//  Created by Moha on 9/22/24.
//

import SwiftUI

//// enable the drag to go back
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        if(MSNavigations.shared.shouldSwipeBack) {
            interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
