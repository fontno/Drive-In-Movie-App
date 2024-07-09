//
//  MaterialButtonStyle.swift
//  Movies
//
//  Created by Brian Fontenot on 8/29/23.
//

import SwiftUI

struct MaterialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(Material.ultraThin, in: Circle())
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
