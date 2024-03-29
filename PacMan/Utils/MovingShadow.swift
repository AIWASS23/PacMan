//
//  MovingShadow.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct MovingShadowModifier: AnimatableModifier {
    var offset: CGSize
    var radius: CGFloat

    var animatableData: AnimatablePair<CGSize, CGFloat> {
        get { AnimatablePair(offset, radius) }
        set {
            offset = newValue.first
            radius = newValue.second
        }
    }

    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: radius)
            .offset(x: offset.width, y: offset.height)
    }
}

extension View {
    func movingShadow(offset: CGSize, radius: CGFloat) -> some View {
        self.modifier(MovingShadowModifier(offset: offset, radius: radius))
    }
}

