//
//  SwiftUIView.swift
//  DesignKith
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI

public struct DKText: View {
  
  public enum Style {
    case title
    case heading
    case body
    case caption
    case button
  }
  
  private let text: String
  private let style: Style
  
  public init(
    _ text: String,
    style: Style = .body
  ) {
    self.text = text
    self.style = style
  }
  
  public var body: some View {
    Text(text)
      .font(font)
      .foregroundStyle(.primary)
  }
  
  private var font: Font {
    switch style {
    case .title:
        .largeTitle.bold()
      
    case .heading:
        .title2.bold()
      
    case .body:
        .body
      
    case .caption:
        .caption
      
    case .button:
        .body.weight(.semibold)
    }
  }
}
