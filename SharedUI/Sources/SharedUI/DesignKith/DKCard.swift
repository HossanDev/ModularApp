//
//  SwiftUIView.swift
//  DesignKith
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI

public struct DKCard<Content: View>: View {

    private let content: Content

    public init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.background)
            )
            .shadow(
                radius: 4,
                y: 2
            )
    }
}
