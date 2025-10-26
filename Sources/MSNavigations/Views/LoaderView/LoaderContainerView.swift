//
//  LoaderContainerView.swift
//  MSNavigations
//
//  Created by Moha on 10/26/25.
//


import SwiftUI

public struct LoaderContainerView<Loader : View>: ViewModifier {
    var isLoading: Binding<Bool>
    let loaderView: () -> Loader
    
    public init(
        isLoading: Binding<Bool>,
        @ViewBuilder loaderView: @escaping () -> Loader
    ) {
        self.isLoading = isLoading
        self.loaderView = loaderView
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading.wrappedValue {
                loaderView()
            }
        }
    }
}

public extension View {
    func loaderContainer<Loader: View>(
        isLoading: Binding<Bool>,
        @ViewBuilder loadingView: @escaping () -> Loader
    ) -> some View {
        modifier(LoaderContainerView(isLoading: isLoading, loaderView: loadingView))
    }
}

@available(iOS 17.0, *)
@Observable
public class LoaderManager {
    public var isLoading = false
    public var loadingView : AnyView = AnyView(EmptyView())
    
    public init(isLoading: Bool = false, loadingView: AnyView = AnyView(EmptyView())) {
        self.isLoading = isLoading
        self.loadingView = loadingView
    }
    
    public func startLoading<V:View>(loadingView: ()->V) {
        isLoading = true
        self.loadingView = AnyView(loadingView())
    }
    
    public func stopLoading(){
        isLoading = false
        self.loadingView = AnyView(EmptyView())
    }
}

public class ObservableLoaderManager : ObservableObject {
    @Published public var isLoading = false
    @Published public var loadingView : AnyView = AnyView(EmptyView())
    
    public init(isLoading: Bool = false, loadingView: AnyView = AnyView(EmptyView())) {
        self.isLoading = isLoading
        self.loadingView = loadingView
    }
    
    public func startLoading<V:View>(loadingView: ()->V) {
        isLoading = true
        self.loadingView = AnyView(loadingView())
    }
    
    public func stopLoading(){
        isLoading = false
        self.loadingView = AnyView(EmptyView())
    }
}
