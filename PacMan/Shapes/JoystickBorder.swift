//
//  JoystickBorder.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct JoystickBorder: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
// MARK: - Outer border
            path.move(to: CGPoint(x: rect.maxX * 0.33, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.33, y: rect.maxY))

            path.move(to: CGPoint(x: rect.maxX * 0.66, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX * 0.66, y: rect.minY))


// MARK: - Inner border
            path.move(to: CGPoint(x: rect.maxX * 0.33, y: rect.maxY * 0.05))
            path.addLine(to: CGPoint(x: rect.maxX * 0.05, y: rect.maxY * 0.05))

            path.addLine(to: CGPoint(x: rect.maxX * 0.05, y: rect.maxY * 0.95))
            path.addLine(to: CGPoint(x: rect.maxX * 0.33, y: rect.maxY * 0.95))

            path.move(to: CGPoint(x: rect.maxX * 0.66, y: rect.maxY * 0.95))
            path.addLine(to: CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.95))

            path.addLine(to: CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.05))
            path.addLine(to: CGPoint(x: rect.maxX * 0.66, y: rect.maxY * 0.05))
        }
    }
}
