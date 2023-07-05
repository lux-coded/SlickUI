//
//  SideMenu.swift
//  SlickUI
//
//  Created by Luka Selak on 7/3/23.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
      
      VStack(spacing: 0) {
        HStack {
          Image(systemName: "person.crop.circle.fill")
            .font(.system(size: 50))
          Text("user420")
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        Rectangle()
          .frame(height: 2)
          .opacity(0.1)
          .padding(.horizontal)
        VStack {
          ForEach(sideItems) {
            item in HStack {
              Image(systemName: item.icon)
                .font(.system(size: 50))
              Text(item.label)
            }
            .frame(maxWidth: 240, alignment: .leading)
            .padding(5)
          }
        }
        Spacer()
        Text("Log Out")
      }
      .foregroundColor(.gray)
      .frame(maxWidth: 300, maxHeight: .infinity)
      .background(Color("Background2"))
      .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenuItem: Identifiable {
  let id = UUID()
  let icon: String
  let label: String
}

var sideItems = [
  SideMenuItem(icon: "person.crop.circle.fill", label: "Account"),
  SideMenuItem(icon: "info.bubble.fill", label: "Info & Feedback"),
  SideMenuItem(icon: "star.circle.fill", label: "Premium"),
  SideMenuItem(icon: "gear", label: "Settings"),
]


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
