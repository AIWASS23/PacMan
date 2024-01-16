//
//  MazeView.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

struct MazeView: View {

    var body: some View {
        GeometryReader { geo in
            Maze()
                .stroke(.cyan, lineWidth: 4)
                .frame(width: geo.size.width, height: geo.size.width)

        }
    }
}

#Preview {
    MazeView()
}
