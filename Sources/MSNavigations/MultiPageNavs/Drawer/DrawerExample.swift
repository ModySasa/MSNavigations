//
//  DrawerExample.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import SwiftUI

struct DrawerExample: View {
    @State var selection : Int = 1
    var pages : [DrawerPages] = .init(arrayLiteral: .Test1 , .Test3 , .Test2)
    var body: some View {
        Drawer(
            .halfScreen
            , selection: $selection
            , hamburgerTopPadding: 40
            , hamburgerLeadingPadding: 20
            , mainPagePaddingVertical: 50
            , mainPagePaddingTrailing: 50
            , drawerPaddingVertical: 0
            , drawerPaddingHorizontal: 20
        ) {
            ForEach(pages, id: \.self) { item in
                item.view($selection)
            }
        } burgerIcon: {
            BurgerIcon()
        } background: {
            Color.blue
        } drawerBackground: {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.purple)
        } drawerHeader : {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .padding(.top , 50)
        } drawerFooter : {
            Rectangle()
                .frame(height: 10)
                .frame(maxWidth: .infinity)
                .padding()
        } itemView: { item in
            //SINGLE DRAWER ITEM VIEW
            HStack {
                Image(systemName: item.iconName)
                    .foregroundColor(.red)
                Text(item.title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity , alignment: .leading)
        }
        
    }
}

struct DrawerExample_Previews: PreviewProvider {
    static var previews: some View {
        DrawerExample()
    }
}

enum DrawerPages : Hashable {
    case Test1
    case Test2
    case Test3
    
    @ViewBuilder func view(_ selection : Binding<Int>) -> some View {
        switch self {
        case .Test1:
            ZStack {
                Color.gray
                HStack {
                    Text("Number 1")
                    Text("Number 1")
                    Text("Number 1")
                }
            }
            .drawerItem(item(), selection: selection)
        case .Test2:
            ZStack {
                Color.red
                Text("Number 2")
            }
            .drawerItem(item() , selection: selection)
        case .Test3:
            ZStack {
                Color.red
                Text("Number 3")
            }
            .drawerItem(item() , selection: selection)
        }
    }
    
    func item() -> DrawerItem {
        switch self {
        case .Test1:
            return .init(iconName: "heart", title: "Item num 1", index: 1, hasIcon: true , isDraggable: false) {
                
            }
        case .Test2:
            return .init(iconName: "gear", title: "Item num 2", index: 2, hasIcon: false , isDraggable: true) {
                
            }
        case .Test3:
            return .init(iconName: "person", title: "Item num 3", index: 3, hasIcon: false , isDraggable: true , hasPage: false) {
                print("HERE I AM")
            }
        }
    }
}

