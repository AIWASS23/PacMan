//
//  Maze.swift
//  PacMan
//
//  Created by Marcelo de Araújo on 15/01/24.
//

import SwiftUI

struct Maze: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX / 10 * 2, y: rect.midY + 80) )
            path.addLine(to: CGPoint(x: rect.maxX / 10 * 2, y: rect.midY - 10))
            
        }
    }
}
