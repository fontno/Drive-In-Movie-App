//
//  PerspectiveScreenView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct PerspectiveScreenView: View {
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .path(in: geo.frame(in: .global))
                .strokedPath(StrokeStyle(lineWidth: 2))
                .fill(Gradient(colors: [.pink, .indigo]))
                .rotation3DEffect(Angle(degrees: -45), axis: (x: 1, y: 0, z: 0))
        }
    }
}
