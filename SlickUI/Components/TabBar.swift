//
//  TabBar.swift
//  SlickUI
//
//  Created by Luka Selak on 6/30/23.
//

import SwiftUI

struct TabBar: View {
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  var body: some View {
    VStack {
      Spacer()
      HStack {
        content
      }
      .frame(minWidth: 0, maxWidth: 225, minHeight: 0, maxHeight: 75, alignment: .center)
      .background(Color("Background2"))
      .cornerRadius(40)
    }
  }
  
  func buttonClick(_ tab: Tab) {
    selectedTab = tab
  }
  
  var content: some View {
    ForEach(tabItems) {
      item in Button(action: { buttonClick(item.tab) }) {
        Image(systemName: selectedTab == item.tab ? item.iconActive : item.iconInactive)
      }
      .padding(5)
        .foregroundColor(.white)
        .font(.system(size: 45))
    }
  }
  
  
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}

struct TabItem: Identifiable {
  let id = UUID()
  let iconInactive: String
  let iconActive: String
  let tab: Tab
}

var tabItems = [
  TabItem(iconInactive: "house.circle", iconActive: "house.circle.fill", tab: .home),
  TabItem(iconInactive: "person.2.circle", iconActive: "person.2.circle.fill", tab: .groups),
  TabItem(iconInactive: "person.crop.circle", iconActive: "person.crop.circle.fill", tab: .user),
]

enum Tab: String {
  case home
  case groups
  case user
}
