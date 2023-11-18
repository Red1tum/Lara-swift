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
    let localizedName: LocalizedStringKey
    let icon: String
    
    init(name: String, icon: String) {
        self.name = name
        self.localizedName = LocalizedStringKey(name)
        self.icon = icon
    }
}

struct TabItem: View {
    // I don't really think that this view should know about
    // selected tab. I spent like 2hrs trying figure out the
    // way to pass whether it should show name or not, but I
    // couldn't find a way to do that. So keeping it there
    @Binding var selectedTab: String
    let tabInfo: TabInfo
    
    var body: some View {
        Label {
            Text(selectedTab == tabInfo.name ? tabInfo.localizedName : "")
                    .nunito(size: 14)
            } icon: {
                Image(tabInfo.icon)
                    .resizable()
                    .renderingMode(.template)
                    .iconFrame()
            }
            .padding(12)
            .labelStyle(.titleAndIcon)
            .fixedSize()
    }
}

struct BottomBar: View {
    @Binding var selectedTab: String
    private let tabs: [TabInfo] = [
        TabInfo(name: "Home", icon: Icons.home),
        TabInfo(name: "Schedule", icon: Icons.calendar),
        TabInfo(name: "Chat", icon: Icons.chat),
        TabInfo(name: "Profile", icon: Icons.profile)
    ]
    var body: some View {
        Divider()
            .foregroundColor(Colors.primary)
            .background(Colors.primary)
        HStack(alignment: .center, spacing: 12) {
            ForEach(tabs) {tab in
                let shouldShow = selectedTab == tab.name
                TabItem(selectedTab: $selectedTab, tabInfo: tab)
                    .background(shouldShow ? Colors.transparentLightBlue : Colors.primary)
                    .foregroundColor(shouldShow ? Colors.lightBlue : Colors.blackishGray)
                    .frame(minWidth: Sizes.tabItemMinWidth)
                    .cornerRadius(Sizes.cornerRadius)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab.name
                        }
                    }
            }
        }
        .padding([.leading, .trailing], 12)
        .padding(.vertical, 8)
        .frame(alignment: .center)
        .background(Colors.primary)
    }
}

#Preview {
    BottomBar(selectedTab: .constant("Home"))
        .environment(\.locale, .init(identifier: "ru"))
}
