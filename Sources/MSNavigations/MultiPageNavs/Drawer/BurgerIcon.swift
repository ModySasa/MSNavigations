//
//  BurgerIcon.swift
//  Learn no core
//
//  Created by Corptia 02 on 30/05/2023.
//

import SwiftUI

public struct BurgerIcon: View {
    var hamburgetTopPadding : CGFloat = 20
    var hamburgetLeadingPadding : CGFloat = 20
    var iconName : String = ""
    var iconColor : Color = .green
    
    public init(hamburgetTopPadding: CGFloat = 20, hamburgetLeadingPadding: CGFloat = 20 , iconName : String = "" , iconColor : Color = .green) {
        self.hamburgetTopPadding = hamburgetTopPadding
        self.hamburgetLeadingPadding = hamburgetLeadingPadding
        self.iconName = iconName
        self.iconColor = iconColor
    }
    
    public var body: some View {
        hamburgerIcon
    }
    
    //Burger icon
    var hamburgerIcon : some View {
        burgerImg
            .resizable()
            .frame(width: 50 , height: 25)
            .foregroundColor(iconColor)
    }
    
    var burgerImg : Image {
        iconName.isEmpty ? Image(systemName: "line.3.horizontal") :
        Image(iconName)
    }
}

struct BurgerIcon_Previews: PreviewProvider {
    static var previews: some View {
        BurgerIcon()
    }
}
