//
//  CaptionBackgroundView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct CaptionBackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(colors: [colorScheme == .dark ? .black : .white, .clear], startPoint: .bottom, endPoint: .top), in: Rectangle())
    }
}

struct CaptionBackgroundView_Previews: PreviewProvider {

    static var previews: some View {
        CaptionBackgroundView()
    }
}
