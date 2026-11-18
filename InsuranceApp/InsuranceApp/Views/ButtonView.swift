//
//  ButtonView.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI
import SharedUI

struct ButtonView: View {
  var body: some View {
    VStack(spacing: 16) {
      
      DKButton("Continue", style: .primary) {
        print("Continue tapped")
      }
      
      DKButton("Cancel", style: .secondary) {
        print("Cancel tapped")
      }
      
      DKButton("Delete Account", style: .destructive) {
        print("Delete tapped")
      }
      
      DKButton("Forgot Password?", style: .text) {
        print("Forgot password tapped")
      }
      
      DKDivider()
      
      DKCard {
        VStack(alignment: .leading) {
          DKText(
            "Current balance",
            style: .caption
          )
          
          DKText(
            "£2,450.50",
            style: .title
          )
        }
      }
    }
    .padding()
  }
}

#Preview {
  ButtonView()
}
