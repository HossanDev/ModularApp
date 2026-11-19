//
//  SwiftUIView.swift
//  DesignKith
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI

public struct DKDivider: View {
  
  public init() {}
  
  public var body: some View {
    Rectangle()
      .fill(.gray.opacity(0.3))
      .frame(height: 1)
  }
}
