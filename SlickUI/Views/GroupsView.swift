//
//  GroupsView.swift
//  SlickUI
//
//  Created by Luka Selak on 7/3/23.
//

import SwiftUI

struct GroupsView: View {
  @State private var searchTerm = ""
  var body: some View {
    
    ZStack {
      Color("Background")
        .ignoresSafeArea()
      VStack {
        Text("Groups")
          .customFont(.largeTitle)
        TextField("Search", text: $searchTerm)
          .frame(maxWidth: .infinity, maxHeight: 50)
          .padding(.leading, 20)
          .background(.white)
          .cornerRadius(10)
          .padding(.horizontal, 20)
        List (searchResults) {
          person in Text(person.name)
        }
        .scrollContentBackground(.hidden)
        .searchable(text: $searchTerm)
      }
    } 
  }
  
  var searchResults: [Person] {
    if searchTerm.isEmpty {
      return peopleList
    } else {
      return peopleList.filter { $0.name.contains(searchTerm) }
    }
  }
}

struct Person: Identifiable {
  let id = UUID()
  let name: String
}

let peopleList: [Person] = [
  Person(name: "Kenzie Cross"),
  Person(name: "Judah Green"),
  Person(name: "Nataly Pineda"),
  Person(name: "Isaiah Sharp"),
  Person(name: "John Hebert"),
  Person(name: "Cameron Tucker"),
  Person(name: "Liana Sanford"),
  Person(name: "Anahi Hobbs"),
  Person(name: "Marissa Moss"),
  Person(name: "Gauge Blevins"),
  Person(name: "Simone Norton"),
  Person(name: "Reed Ramirez"),
  Person(name: "Dale Knox"),
  Person(name: "Isis Dodson"),
  Person(name: "Ari Baxter"),
  Person(name: "Darion Gibson"),
  Person(name: "Steve Haney"),
  Person(name: "Lyla Wheeler"),
  Person(name: "Isai Ritter"),
  Person(name: "Leonidas Jefferson"),
  Person(name: "Kendall Holloway"),
  Person(name: "Miranda Saunders"),
  Person(name: "Alisha Ramsey"),
  Person(name: "Jazmine Richmond"),
  Person(name: "Freddy Bass"),
  Person(name: "Conner Stein"),
  Person(name: "Joaquin Espinoza"),
  Person(name: "Arielle Webster"),
]

struct GroupsView_Previews: PreviewProvider {
  static var previews: some View {
    GroupsView()
  }
}
