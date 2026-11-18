//
//  SwiftUIView.swift
//  DesignKith
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI

public struct DKTextField: View {
  
  private let title: String
  private let placeholder: String
  @Binding private var text: String
  
  public init(
    title: String,
    placeholder: String = "",
    text: Binding<String>
  ) {
    self.title = title
    self.placeholder = placeholder
    self._text = text
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      DKText(
        title,
        style: .caption
      )
      
      TextField(
        placeholder,
        text: $text
      )
      .padding(.horizontal, 16)
      .frame(height: 52)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .stroke(.gray, lineWidth: 1)
      )
    }
  }
}
