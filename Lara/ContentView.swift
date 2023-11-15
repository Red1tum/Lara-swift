//
//  ContentView.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var SelectedTab: String = "Home"
    
    
    var body: some View {
        ZStack {
            TabView(selection: $SelectedTab) {
                HomeScreen()
                    .tag("Home")
                Text("Not implemented")
                    .tag("Schedule")
                Text("Not implemented")
                    .tag("Chat")
                Text("Not implemented")
                    .tag("Profile")
            }
            Spacer()
            VStack {
                Spacer()
                BottomBar(selectedTab: $SelectedTab)
                    .frame(maxWidth: .infinity)
                    .background(Colors.primary)
            }
        }
    }
}

#Preview {
    ContentView()
}
