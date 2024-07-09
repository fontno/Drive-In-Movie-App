//
//  MovieScreen.swift
//  Movies
//
//  Created by Brian Fontenot on 8/28/23.
//

import SwiftUI

struct MovieScreen: View {
    var body: some View {
        Circle()
            .trim(from: 0.1, to: 0.4)
            .rotation(Angle.degrees(180))
            .stroke(Gradient(colors: [.blue, .pink]), style: .init(lineWidth: 2))
            .scaleEffect(3.5)
            .offset(y: 140)
    }
}
