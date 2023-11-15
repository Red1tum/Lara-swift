//
//  BottomBar.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

struct TabInfo: Identifiable {
    // so to do forech I need to create id field???
    let id = UUID()
    let name: String
    let icon: String
}

struct TabItem: View {
    // I don't really think that this view should know about
    // selected tab. I spent like 2hrs trying figure out the
    // way to pass whether it should show name or not, but I
    // couldn't find a way to do that. So keeping it there
    @Binding var selectedTab: String
    @State var shouldShowName: Bool
    let tabInfo: TabInfo
    
    var body: some View {
        Label {
            Text(selectedTab == tabInfo.name ? tabInfo.name : "")
                    .nunito(size: 12)
            } icon: {
                Image(tabInfo.icon)
                    .renderingMode(.template)
            }
            .padding(12)
            .labelStyle(.titleAndIcon)
            .fixedSize()
    }
}

struct BottomBar: View {
    @Binding var selectedTab: String
    private let tabs: [TabInfo] = [
        TabInfo(name: "Home", icon: "home"),
        TabInfo(name: "Schedule", icon: "calendar"),
        TabInfo(name: "Chat", icon: "message"),
        TabInfo(name: "Profile", icon: "profile")
    ]
    var body: some View {
        Divider()
            .foregroundColor(.white)
        HStack(alignment: .center, spacing: 12) {
            ForEach(tabs) {tab in
                let shouldShow = selectedTab == tab.name
                TabItem(selectedTab: $selectedTab, shouldShowName: shouldShow, tabInfo: tab)
                    .background(shouldShow ? Color(red: 0.39, green: 0.71, blue: 1).opacity(0.1) : .white)
                    .foregroundColor(shouldShow ? Color(red: 0.39, green: 0.71, blue: 1) : Color(red: 0.53, green: 0.59, blue: 0.73))
                    .frame(minWidth: 70)
                    .cornerRadius(12)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab.name
                        }
                    }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(alignment: .center)
        .background(.white)
    }
}

#Preview {
    BottomBar(selectedTab: .constant("Home"))
}
