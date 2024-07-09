//
//  BackgroundBlur.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct BackgroundBlur: View {
    @Environment(\.colorScheme) var colorScheme
    @State var movie: Movie = Movie.first()
    
    var body: some View {
        ZStack {
            
            Image(uiImage: movie.moviePoster())
                .resizable()
                .scaleEffect(2)
                .saturation(0)
                .overlay(.ultraThinMaterial)
            
            LinearGradient(colors: [.blue, .indigo], startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
                .opacity(0.8)
                .ignoresSafeArea()
            
            if colorScheme == .light {
                Color.white
                    .opacity(0.6)
                    .ignoresSafeArea()
            } else {
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
            }
            
        }
    }
}
struct BackgroundBlur_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlur(movie: Movie.first())
    }
}
