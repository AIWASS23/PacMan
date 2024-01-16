//
//  PacManShape.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct PacManShape: Shape {
    var mouthAngle: Double

    var animatableData: Double {
        get { mouthAngle }
        set { mouthAngle = newValue }
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX * 0.4, y: rect.midY))

            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: mouthAngle),
                endAngle: Angle(degrees: 360 - mouthAngle),
                clockwise: false)
        }
    }
}
