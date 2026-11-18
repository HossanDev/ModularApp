//
//  LoginView.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI
import SharedUI

struct LoginView: View {
  
  @State private var email = ""
  
  var body: some View {
    VStack(spacing: DKSpacing.medium) {
      
      DKText(
        "Welcome back",
        style: .title
      )
      
      DKTextField(
        title: "Email",
        placeholder: "Enter your email",
        text: $email
      )
      
      DKButton(
        "Continue",
        style: .primary
      ) {
        // Login
      }
    }
    .padding(DKSpacing.medium)
  }
}

#Preview {
  LoginView()
}
