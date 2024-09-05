//
//  MyStackViewModel.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//


import Foundation
import SwiftUI

@available(iOS 16.0, *)
public class MyStackViewModel : ObservableObject  {
//    public var viewModel : GeneralViewModel? = nil
//    
    public init(/*_ viewModel:GeneralViewModel? = nil*/) {
//        self.viewModel = viewModel
    }
    
    @Published public var presentedItems = NavigationPath()
    
    //TODO: make an extension to the MyStackViewModel and copy the following methods but using your own destinations
    func moveTo(_ destination:MyStacks , clearStack:Bool = false , drawerIndex : Int? = nil , bottomNavIndex : Int? = nil , shouldRestore : Bool? = nil){
        if(clearStack){
            self.presentedItems = .init()
        }
//        if let drawerIndex {
//            viewModel?.drawerIndex = drawerIndex
//        }
//        if let bottomNavIndex {
//            viewModel?.bottomNavIndex = bottomNavIndex
//        }
//        if let shouldRestore {
//            viewModel?.shouldRestore = shouldRestore
//        }
        self.presentedItems.append(destination)
    }
    
    func clearStack(_ destination:MyStacks = .Test){
        self.presentedItems = .init()
        if(destination != .Test) {
            self.presentedItems.append(destination)
        }
    }
}

//TODO: make an enum like the following to add your destinations
enum MyStacks : String{
    case Home = "Home"
    case SignUp = "SignUp"
    case OTP = "OTP"
    case LogIn = "LogIn"
    case ForgotPass = "ForgotPass"
    case ResetPass = "ResetPass"
    case Test = "Test"
    
    @ViewBuilder func view() -> some View{
        if #available(iOS 16.0, *) {
            switch self{
//            case .LogIn:
//                LogInPage16(hasNavBarAlready: true)
//            case .SignUp:
//                SignUpPage16()
//            case .ForgotPass:
//                ForgotPasswordPage16()
//            case .OTP:
//                OTPPage16()
//            case .ResetPass:
//                ResetPasswordPage16()
            default:
                TestPage()
            }
        } else {
            switch self{
//            case .LogIn:
//                LogInPage15(hasNavBarAlready: true)
//            case .SignUp:
//                SignUpPage15()
//            case .ForgotPass:
//                ForgotPasswordPage15()
//            case .OTP:
//                OTPPage15()
//            case .ResetPass:
//                ResetPasswordPage15()
            default:
                TestPage()
            }
        }
    }
}
