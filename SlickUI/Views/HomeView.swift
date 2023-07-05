//
//  HomeView.swift
//  SlickUI
//
//  Created by Luka Selak on 7/3/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()
      ScrollView {
        content
      }
    }
  }
  
  var content: some View {
    VStack {
      Text("Feed")
        .customFont(.largeTitle)
      DividerLineView()
      Text("Recent Groups")
        .customFont(.title2)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 0) {
          ForEach(groupList) { group in
            GroupCard(details: group)
          }
        }
      }
      DividerLineView()
      Text("Recent Chats")
        .customFont(.title2)
      ForEach(chatList) {
        chat in ChatCard(details: chat)
      }
    }
  }
}

struct GroupItem: Identifiable {
  let id = UUID()
  let name: String
  let description: String
  let icon: String
  let groupColor: Color
}

struct ChatItem: Identifiable {
  let id = UUID()
  let name: String
  let chatColor: Color
}

let groupList = [
  GroupItem(name: "Overwatch", description: "Overwatch group.", icon: "o.cicle.fill", groupColor: .red),
  GroupItem(name: "League of Legends", description: "LoL group.", icon: "o.cicle.fill", groupColor: .blue),
  GroupItem(name: "World of Warcraft", description: "WoW group.", icon: "o.cicle.fill", groupColor: .yellow),
  GroupItem(name: "Street Figher", description: "SF group.", icon: "o.cicle.fill", groupColor: .green),
  GroupItem(name: "Dead Space", description: "DS group.", icon: "o.cicle.fill", groupColor: .cyan),
]

let chatList = [
  ChatItem(name: "Jake", chatColor: .red),
  ChatItem(name: "Cammy", chatColor: .green),
  ChatItem(name: "Vanessa", chatColor: .purple),
  ChatItem(name: "Michael", chatColor: .cyan)
]

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}

struct GroupCard: View {
  let details: GroupItem
  
  var body: some View {
    VStack {
      HStack {
        Image(systemName: details.icon)
          .font(.system(size: 30))
        Text(details.name)
          .customFont(.title2)
      }
      Text(details.description)
        .customFont(.body)
    }
    .frame(minWidth: 225, idealWidth: 225, maxWidth: 225, minHeight: 300, idealHeight: 300, maxHeight: 300, alignment: .center)
    .background(details.groupColor)
    .foregroundColor(.white)
    .cornerRadius(20)
    .padding(10)
  }
}

struct DividerLineView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 30, style: .continuous)
      .frame(height: 2)
      .foregroundColor(Color("Background2"))
      .padding(.horizontal, 10)
  }
}

struct ChatCard: View {
  let details: ChatItem
  var body: some View {
    HStack {
      Image(systemName: "person.crop.circle")
        .font(.system(size: 40))
        .foregroundColor(.white)
        .padding(.horizontal, 10)
      Text(details.name)
        .customFont(.title3)
    }
    .frame(minWidth: 300, maxWidth: .infinity, minHeight: 75, alignment: .leading)
    .background(details.chatColor)
    .foregroundColor(.white)
    .cornerRadius(10)
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
  }
}
