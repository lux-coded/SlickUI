//
//  SignInView.swift
//  SlickUI
//
//  Created by Luka Selak on 6/26/23.
//

import SwiftUI

struct SignInView: View {
  @State var email = ""
  @State var password = ""
  var body: some View {
    VStack {
      Text("Sign In")
        .customFont(.largeTitle)
      TextField("E-Mail", text: $email)
        .customTextField(icon: "envelope.fill")
      SecureField("Password", text: $password)
        .customTextField(icon: "lock.rectangle.fill")
      ButtonView(title: "Sign In")
        .frame(maxWidth: 330)
      HStack {
        Rectangle().frame(height: 1).opacity(0.2)
        Text("OR").customFont(.subheadline2)
          .foregroundColor(.black.opacity(0.3))
        .padding(10)
        Rectangle().frame(height: 1).opacity(0.2)
      }
      Text("Sign up with Email, Apple or PlayStation")
        .customFont(.subheadline)
        .foregroundColor(.secondary)
      HStack {
        Image(systemName: "apple.logo")
          .font(.system(size: 35)).offset(y: -1)
          .frame(width: 50, height: 50, alignment: .center)
          .foregroundColor(.white)
          .background(.black)
          .cornerRadius(.infinity)
          .padding(5)
        Image(systemName: "playstation.logo")
          .font(.system(size: 30))
          .frame(width: 50, height: 50, alignment: .center)
          .foregroundColor(.white)
          .background(.black)
          .cornerRadius(.infinity)
          .padding(5)
        
      }
    }
    .padding(30)
    .background(.regularMaterial)
    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
    .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
    .padding()
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
