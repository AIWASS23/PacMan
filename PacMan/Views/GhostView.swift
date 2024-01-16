//
//  Ghost.swift
//  PacMan
//
//  Created by Marcelo de Araújo on 9/28/23.
//

import SwiftUI

struct GhostView: View {
    let character: Character
    let eyeDirection: Direction
    let scale: CGFloat
    
    var ghostColor: Color {
        switch character {
        case .blinky:
            return .red
        case .pinky:
            return .pink.opacity(0.4)
        case .inky:
            return .mint.opacity(0.4)
        case .clyde:
            return .orange.opacity(0.8)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
// MARK: - Pinky, Inky, and Clyde receive a white base layer behind main ghost
                if character != .blinky {
                    GhostShape()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundStyle(.white)
                }
                
                // Main ghost object
                GhostShape()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundStyle(ghostColor)
                
                EyesView(direction: eyeDirection)
                    .offset(y: geo.size.height * 0.16)
            }
        }
        .frame(width: scale * 50, height: scale * 50)
    }
}

#Preview {
    GhostView(character: .pinky, eyeDirection: .left, scale: 3)
}
