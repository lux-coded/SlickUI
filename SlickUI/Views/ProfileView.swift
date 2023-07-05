//
//  ProfileView.swift
//  SlickUI
//
//  Created by Luka Selak on 7/4/23.
//

import SwiftUI

struct ProfileView: View {
  @State var firstName = "user420"
  @State var lastName = "123456789420"
    var body: some View {
      ZStack {
        Color("Background")
          .ignoresSafeArea()
        VStack {
          Image(systemName: "person.crop.circle")
            .font(.system(size: 150, weight: .thin))
          Text("user420")
            .customFont(.largeTitle)
          Form {
            TextField("Username", text: $firstName)
              .frame(maxWidth: .infinity, maxHeight: 50)
              .foregroundColor(.gray)
              .disabled(true)
            SecureField("Password", text: $lastName)
              .frame(maxWidth: .infinity, maxHeight: 50)
              .foregroundColor(.gray)
              .disabled(true)
          }.scrollContentBackground(.hidden)
          Spacer()
          Button(action: {
            print("LOG")
          }) {
            Text("Log Out")
              .frame(maxWidth: 300, maxHeight: 60)
          }
          .background(.red)
          .foregroundColor(.white)
          .customFont(.title2)
          .cornerRadius(10)
        }
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
