//
//  TopBar.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct TopBar: View {
    @State var userName: String
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .poppinsRegular(size: 16)
                    .foregroundColor(Colors.blackishGray)
                Text("Hi \(userName)")
                    .poppinsBold(size: 20)
                    .bold()
                    .foregroundColor(Colors.midnight)
            }
            Spacer()
            Image("avatar")
        }
        .padding(0)
        .frame(width: Sizes.elementWidth, alignment: .center)
    }
}

#Preview {
    TopBar(userName: "James")
}
