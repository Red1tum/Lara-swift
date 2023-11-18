//
//  TopBar.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct TopBar: View {
    @StateObject var user: User
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .poppinsRegular(size: 16)
                    .foregroundColor(Colors.blackishGray)
                Text("Hi \(user.name)")
                    .poppinsBold(size: 20)
                    .bold()
                    .foregroundColor(Colors.midnight)
            }
            Spacer()
            Image(user.imageName)
        }
        .padding(0)
        .frame(width: Sizes.elementWidth, alignment: .center)
    }
}

#Preview {
    let user = User(name: "James", imageName: "avatar")
    return TopBar(user: user)
        .environment(\.locale, .init(identifier: "ru"))
}
