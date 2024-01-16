//
//  GhostShape.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct GhostShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in

            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))

            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.22, y: rect.maxY),
                control: CGPoint(
                    x: rect.width * 0.15,
                    y: rect.height * 0.9
                )
            )

            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.4, y: rect.maxY),
                control: CGPoint(
                    x: rect.width * 0.3,
                    y: rect.height * 1.10
                )
            )

            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.6, y: rect.maxY),
                control: CGPoint(
                    x: rect.width * 0.5,
                    y: rect.height * 0.9
                )
            )

            path.addQuadCurve(
                to: CGPoint(x: rect.width * 0.8, y: rect.maxY),
                control: CGPoint(
                    x: rect.width * 0.7,
                    y: rect.height * 1.10
                )
            )

            path.addQuadCurve(
                to: CGPoint(x: rect.maxY, y: rect.maxY),
                control: CGPoint(
                    x: rect.width * 0.87,
                    y: rect.height * 0.9
                )
            )

// MARK: - Rectangular base

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

// MARK: - Semi-cirlcle top

            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: true)
        }
    }
}
