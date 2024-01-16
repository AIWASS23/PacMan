//
//  EyesView.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct EyesView: View {
    let direction: Direction

// MARK: - Switch on direction to provide a pupil alignment in the body

    var alignment: Alignment {
        switch direction {
        case .left:
                .leading
        case .right:
                .trailing
        case .up:
                .top
        case .down:
                .bottom
        case .none:
                .center
        }
    }

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: geo.size.width * 0.1) {
                Spacer()
// MARK: - Left eye
                ZStack(alignment: alignment) {
// MARK: - Eyeball
                    Capsule()
                        .frame(
                            width: geo.size.width * 0.25,
                            height: geo.size.width * 0.35
                        )
                        .foregroundStyle(.white)

// MARK: -  Pupil
                    Circle()
                        .frame(width: geo.size.width * 0.18)
                        .foregroundStyle(.blue)
                }

// MARK: - Right eye
                ZStack(alignment: alignment) {

// MARK: - Eyeball
                    Capsule()
                        .frame(
                            width: geo.size.width * 0.25,
                            height: geo.size.width * 0.35
                        )
                        .foregroundStyle(.white)

// MARK: - Pupil
                    Circle()
                        .frame(width: geo.size.width * 0.18)
                        .foregroundStyle(.blue)
                }
                Spacer()
            }
            .offset(x: 0, y: geo.size.height * 0.2)
        }
    }
}


#Preview {
    EyesView(direction: .down)
}
