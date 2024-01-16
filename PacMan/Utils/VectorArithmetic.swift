//
//  VectorArithmetic.swift
//  PacMan
//
//  Created by Marcelo De Araújo on 16/01/24.
//

import SwiftUI

extension CGSize: VectorArithmetic {
    mutating public func scale(by rhs: Double) {
        self *= rhs
    }
    
    public var magnitudeSquared: Double {
        return Double(width * width + height * height)
    }
    
    public static var zero: CGSize {
        return CGSize(width: 0, height: 0)
    }

    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }

    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }

    public static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }

    public static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }

    public static func * (lhs: CGSize, rhs: Double) -> CGSize {
        return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
    }

    public static func *= (lhs: inout CGSize, rhs: Double) {
        lhs.width *= CGFloat(rhs)
        lhs.height *= CGFloat(rhs)
    }
}
