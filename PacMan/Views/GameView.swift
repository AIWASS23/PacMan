//
//  GameView.swift
//  PacMan
//
//  Created by Marcelo de Araújo on 10/01/24.
//

import SwiftUI

struct GameView: View {
    let scale = 1.5
    
    @State private var mouthOpen = false
    @State private var direction: Direction = .none
    
    @State private var pacManXOffset: CGFloat = .zero
    @State private var pacManYOffset: CGFloat = .zero
    
    @State private var gameStarted = false
    @State private var resetPressed = false
    @State private var pacManMovementTimer: Timer?

// MARK: - Return an rotation amount for PacMan
    private var rotationDegree: Double {
        switch direction {
        case .left:
            180
        case .right:
            0
        case .up:
            270
        case .down:
            90
        case .none:
            0
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    
                    ZStack{

                        PacManView(scale: scale, mouthOpen: $mouthOpen)
                            .frame(width: geo.size.width, height: geo.size.width)
                            .rotationEffect(Angle(degrees: rotationDegree))
                            .offset(x: pacManXOffset * 0.8, y: pacManYOffset * 0.8)
                        
                    }
                    Spacer()
                    
                    HStack {
                        Joystick(scale: scale * 0.5, direction: $direction)

                        
                        Spacer()
                        VStack(spacing: -10) {
                            Text("Start")
                                .fontDesign(.monospaced)
                                .font(.title2).bold()
                                .foregroundStyle(.red)
                            
                            ArcadeButton(color: .red, scale: scale * 0.5) {
                                startGame()
                            }
                            .padding(.bottom)
                            
                            Text("Reset")
                                .fontDesign(.monospaced)
                                .font(.title2).bold()
                                .foregroundStyle(.white)
                            
                            ArcadeButton(color: .white, scale: scale * 0.5) {
                                reset()
                            }
                        }
                    }
                    .padding()
                }
            }
            .onChange(of: direction) { oldValue, newValue in
                movePacMan(in: geo)
                
// MARK: - Begin mouth animation with first move of joystick
                if oldValue == .none {
                    withAnimation(.linear(duration: 0.15).repeatForever()) {
                        mouthOpen.toggle()
                    }
                }
            }
        }
    }
    
    private func startGame() -> () {
        direction = .right
// MARK: - this will notify onChange(of: direction) to call movePacMan(in geo:)
    }
    
    private func reset() {
        direction = .none
        mouthOpen = false
        pacManXOffset = 0
        pacManYOffset = 0
    }
    
    private func movePacMan(in geo: GeometryProxy) {
        let cellSize = geo.size.width / 10
        
            withAnimation(.linear(duration: 0.2)){
                switch direction {
                case .left:
                    while pacManXOffset > -geo.size.width / 2{
                        pacManXOffset -= cellSize
                    }

                    
                case .right:
                    while pacManXOffset < geo.size.width / 2{
                        pacManXOffset += cellSize
                        
                    }
                case .up:
                    while pacManYOffset > -geo.size.width / 2 {
                        pacManYOffset -= cellSize
                        
                    }
                case .down:
                    while pacManYOffset < geo.size.width / 2{
                        pacManYOffset += cellSize
                        
                    }
                case .none:
                    return
                }
            }
    }
}

#Preview {
    GameView()
}



