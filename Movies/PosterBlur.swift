//
//  PosterBlur.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct PosterBlur: View {
    @State var movie: Movie
    
    var body: some View {
        Image(uiImage: movie.moviePoster())
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .overlay(.regularMaterial)
    }
}
struct PosterBlur_Previews: PreviewProvider {

    static var previews: some View {
        PosterBlur(movie: Movie.all()[0])
    }
}
