//
//  ContentView.swift
//  SlickUI
//
//  Created by Luka Selak on 6/30/23.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  @State var burgerMenu: Bool = false
  
  var body: some View {
    appView
  }
  
  var appView: some View {
    ZStack {
      Color("Background2")
        .ignoresSafeArea()
      
      SideMenu()
        .opacity(burgerMenu ? 1 : 0)
        .offset(x: burgerMenu ? 0 : -300)
      
      Group {
        switch selectedTab {
          case .home:
            HomeView()
          case .groups:
            GroupsView()
          case .user:
            ProfileView()
        }
      }
      .safeAreaInset(edge: .bottom) {
        Color.clear.frame(height: 120)
      }
      .safeAreaInset(edge: .top) {
        Color.clear.frame(height: 55)
      }
      .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .rotation3DEffect(.degrees(burgerMenu ? 30 : 0), axis: (x: 0, y: -1, z: 0))
      .offset(x: burgerMenu ? 265 : 0)
      .scaleEffect(burgerMenu ? 0.95 : 1)
      .ignoresSafeArea()
      
      VStack(alignment: .leading) {
        Button(action: {
          withAnimation(
            .spring(response: 0.5, dampingFraction: 0.7)) {
              burgerMenu.toggle()
          }
        }) {
          
          Image(systemName:
                  burgerMenu ? "xmark.circle.fill"
                : "line.3.horizontal.circle.fill"
          )
          .font(.system(size: 50))
          .foregroundColor(burgerMenu ? .white : Color("Background2"))
          .shadow(color: burgerMenu ? Color("Background2") : .clear, radius: 5, x: 0, y: 0)
          .padding(10)
          .cornerRadius(30)
        }
      }
      .frame(
        maxWidth: .infinity,
        maxHeight: .infinity,
        alignment: .topTrailing
      )
      
      TabBar()
        .offset(y: burgerMenu ? 300 : 0)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
