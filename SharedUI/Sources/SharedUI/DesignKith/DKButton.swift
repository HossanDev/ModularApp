//
//  SwiftUIView.swift
//  DesignKith
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI

public struct DKButton: View {

    // MARK: - Button Style

    public enum Style {
        case primary
        case secondary
        case destructive
        case text
    }

    // MARK: - Properties

    private let title: String
    private let style: Style
    private let action: () -> Void

    // MARK: - Initializer

    public init(
        _ title: String,
        style: Style = .primary,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body.weight(.semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 52)
        }
        .buttonStyle(DKButtonStyle(style: style))
    }
}

// MARK: - Custom Button Style

private struct DKButtonStyle: ButtonStyle {

    let style: DKButton.Style

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(foregroundColor)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 1)
            }
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(
                .easeInOut(duration: 0.15),
                value: configuration.isPressed
            )
    }

    // MARK: - Foreground

    private var foregroundColor: Color {
        switch style {
        case .primary:
            return .white

        case .secondary:
            return .blue

        case .destructive:
            return .red

        case .text:
            return .blue
        }
    }

    // MARK: - Background

    private var backgroundColor: Color {
        switch style {
        case .primary:
            return .blue

        case .secondary, .destructive, .text:
            return .clear
        }
    }

    // MARK: - Border

    private var borderColor: Color {
        switch style {
        case .primary, .text:
            return .clear

        case .secondary:
            return .blue

        case .destructive:
            return .red
        }
    }
}

