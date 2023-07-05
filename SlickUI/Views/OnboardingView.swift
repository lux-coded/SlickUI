//
//  OnboardingView.swift
//  SlickUI
//
//  Created by Luka Selak on 6/23/23.
//

import SwiftUI

struct OnboardingView: View {
  @State var showModal = false
  
  var body: some View {
    ZStack {
      background
      
      content
      
      Color("Shadow")
        .opacity(showModal ? 0.4: 0)
        .ignoresSafeArea()
      
      if showModal {
        SignInView()
          .transition(.move(edge: .bottom).combined(with: .opacity))
          .overlay(
            Button {
              showModal = false
            } label: {
              Image(systemName: "xmark")
                .frame(width: 36, height: 36)
                .foregroundColor(.black)
                .background(.white)
                .mask(Circle())
                .shadow(
                  color:Color("Shadow")
                  .opacity(0.3),
                    radius: 5,
                    x: 0,
                    y: 3)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
          )
      }
    }
  }
  
  var background: some View {
    Image("Spline")
      .blur(radius: 50)
      .offset(x: 200, y: 100)
  }
  
  var content: some View {
    VStack(alignment: .center, spacing: 20) {
      Spacer()
      Text("Connect & Play")
        .frame(width: 300, alignment: .leading)
        .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
      Text("Don't bother searching for teammates, join the Connect & Play club & find a teammate for your activity in seconds!")
        .frame(width: 300, alignment: .center)
        .customFont(.body)
      Spacer()
      HStack {
        Spacer()
        ButtonView(title: "Join the club")
          .frame(maxWidth: 300)
          .onTapGesture {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
              showModal = true
            }
          }
        Spacer()
      }
    }
    .frame(maxWidth: 400)
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}

struct ButtonView: View {
  let title: String
  
  var body: some View {
    HStack(alignment: .center) {
      Text(title)
        .font(.system(size: 20, weight: .medium))
    }
    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
    .background(.white)
    .foregroundColor(.black)
    .cornerRadius(10)
  }
}
