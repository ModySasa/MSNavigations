//
//  TestPage.swift
//  MSNavigations
//
//  Created by Moha on 9/5/24.
//

import SwiftUI

struct TestPage: View {
    var body: some View {
        //Create a page to test the views
        VStack {
            Text("Test Page")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                .padding(.top , 100)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: .infinity , height: 100)
                .padding()
                .overlay {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 80 , height: 50)
                        .foregroundStyle(.blue)
                }
                .padding(.top , 100)
            Spacer()
        }
    }
}

#Preview {
    TestPage().previewModifier()
}
