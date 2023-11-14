//
//  TopBar.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(Font.custom("poppins_regular", size: 16))
                    .foregroundColor(Color(red: 0.53, green: 0.59, blue: 0.73))
                Text("Hi James")
                    .font(Font.custom("popping_bold", size: 20).weight(.bold))
                    .foregroundColor(Color(red: 0.05, green: 0.11, blue: 0.2))
            }
            Spacer()
            Image("avatar")
        }
        .padding(0)
        .frame(width: 327, alignment: .center)
    }
}

#Preview {
    TopBar()
}
