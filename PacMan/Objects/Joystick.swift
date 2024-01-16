//
//  JoyStick.swift
//  PacMan
//
//  Created by Marcelo de Araújo on 10/01/24.
//

import SwiftUI

struct Joystick: View {
    let scale: CGFloat
    let movementRadius: CGFloat = 50.0
    
    @State private var dragAmount = CGSize.zero
    @State private var shadowX: CGFloat = 0
    @State private var shadowY: CGFloat = 0
    
    @Binding var direction: Direction

    var body: some View {
        GeometryReader { geo in
            ZStack {
                JoystickBorder()
                    .stroke(.cyan, lineWidth: 4)
                    .frame(width: geo.size.width, height: geo.size.width)
                    .overlay {
                        VStack {
                            Spacer()
                            Text("MOVE")
                                .font(.system(size: geo.size.width * 0.08))
                                .fontWeight(.black)
                                .foregroundStyle(.cyan)
                                .offset(y: geo.size.height * 0.025)
                        }
                    }
// MARK: - Joystick and Arrows
                ZStack {
// MARK: - Up and down arrows
                    VStack {
                        Triangle()
                            .frame(
                                width: geo.size.width * 0.3,
                                height: geo.size.height * 0.2
                            )
                        Spacer()
                        Triangle()
                            .frame(
                                width: geo.size.width * 0.3,
                                height: geo.size.height * 0.2
                            )
                            .rotationEffect(Angle(degrees: 180))
                    }
                    .frame(
                        width: geo.size.width * 0.9,
                        height: geo.size.width * 0.9
                    )
// MARK: - Left and right arrows
                    HStack {
                        Triangle()
                            .frame(width: geo.size.width * 0.3,
                                   height: geo.size.height * 0.2)
                            .rotationEffect(Angle(degrees: 270))
                        Spacer()
                            .frame(width: geo.size.width * 0.4)
                        Triangle()
                            .frame(
                                width: geo.size.width * 0.3,
                                height: geo.size.height * 0.2
                            )
                            .rotationEffect(Angle(degrees: 90))
                    }
// MARK: - Plastic Ring
                    Circle()
                        .foregroundStyle(Color(white: 0.2))
                        .frame(width: geo.size.width * 0.58)
                    
// MARK: - Joystick
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.white, .red, .black]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .padding()
                            .frame(width: geo.size.width * 0.5)
                        
                        Circle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [Color.white, Color.black]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: geo.size.width * 0.25
                                )
                            )
                            .padding()
                            .frame(width: geo.size.width * 0.5)
                            .opacity(0.2)
                    }
                    .shadow(color: .black, radius: 8, x: shadowX, y: shadowY)
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                direction = calculateDirection(for: gesture.translation)
                                
                                let translation = gesture.translation
                                let distance = sqrt(pow(translation.width, 2) + pow(translation.height, 2))
                                
// MARK: - Check if the distance is within the fixed radius
                                if distance <= geo.size.width * 0.15 {
                                    dragAmount = translation
                                } else {
// MARK: - If the distance exceeds the fixed radius, limit the movement
                                    let angle = atan2(translation.height, translation.width)
                                    let x = geo.size.width * 0.15 * cos(angle)
                                    let y = geo.size.width * 0.15 * sin(angle)
                                    dragAmount = CGSize(width: x, height: y)
                                }
                                
                                withAnimation {
// MARK: - shadow control
                                    shadowX = gesture.translation.width * 0.15
                                    shadowY = gesture.translation.height * 0.15
                                }
                            }
                            .onEnded { _ in
                                dragAmount = .zero
                                shadowX = .zero
                                shadowY = .zero
                            }
                    )
                    .animation(.bouncy(), value: dragAmount)
                    
                }
                .foregroundStyle(.red.opacity(0.9))
            }
        }
        .frame(width: scale * 200, height: scale * 200)
    }
    
// MARK: - Calculate the direction based on dragAmount
    func calculateDirection(for dragAmount: CGSize) -> Direction {
        let angle = atan2(dragAmount.height, dragAmount.width)
        let degrees = angle * 180 / .pi
        
        if -45...45 ~= degrees {
            return .right
        } else if 45...135 ~= degrees {
            return .down
        } else if 135...180 ~= degrees || -180...(-135) ~= degrees {
            return .left
        } else {
            return .up
        }
    }
}

#Preview {
    Joystick(scale: 1.5, direction: .constant(.none))
}
