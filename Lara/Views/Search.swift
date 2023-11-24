//
//  Search.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

struct Search: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("search")
                .iconFrame()
            TextField("Search doctor or health issue", text: $searchText)
                .poppinsRegular(size: 15)
                .foregroundColor(Colors.blackishGray)
        }
        .padding(16)
        .frame(alignment: .leading)
        .background(Colors.darkPasterBlue)
        .cornerRadius(12)
    }
}

#Preview {
    Search()
}
