//
//  CustomTextField.swift
//  SlickUI
//
//  Created by Luka Selak on 6/28/23.
//

import SwiftUI

struct CustomTextField: ViewModifier {
  let icon: String
  func body(content: Content) -> some View {
    content
      .padding(12.5)
      .padding(.leading, 36)
      .frame(maxWidth: 330)
      .background(.white)
      .cornerRadius(10)
      .overlay(alignment: .leading) {
        Image(systemName: icon)
          .frame(maxWidth: 30, maxHeight: 10, alignment: .center)
          .font(.system(size: 30))
          .foregroundColor(.black.opacity(0.8))
          .padding(10)
      }
  }
}

extension View {
  func customTextField(icon: String) -> some View {
    modifier(CustomTextField(icon: icon))
  }
}
