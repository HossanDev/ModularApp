//
//  ContentView.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI
import SharedUI

struct ContentView: View {
  @State private var email = ""
  var body: some View {
    VStack {
      
      DKText(
        "Welcome back",
        style: .title
      )
      
      DKText(
        "Enter your details",
        style: .body
      )
      
      DKTextField(
        title: "Email",
        placeholder: "Enter your email",
        text: $email
      )
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
