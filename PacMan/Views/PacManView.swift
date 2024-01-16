//
//  PacMan.swift
//  PacMan
//
//  Created by Marcelo de Araújo on 10/01/24.
//

import SwiftUI

struct PacManView: View {
    let scale: CGFloat
    
    @Binding var mouthOpen: Bool
    
    var body: some View {
        PacManShape(mouthAngle: mouthOpen ? 45 : 0)
            .frame(width: scale * 50, height: scale * 50)
            .foregroundStyle(.yellow)
    }
}

#Preview {
    PacManView(scale: 5, mouthOpen: .constant(true))
}
