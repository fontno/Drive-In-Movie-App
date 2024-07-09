//
//  NowPlayingPosterView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct NowPlayingPosterView: View {
    @State var movie: Movie
    
    var body: some View {
        
        VStack {
            Image(uiImage: movie.moviePoster())
                .resizable()
                .scaledToFit()
        }
    }
}

struct NowPlayingPosterView_Previews: PreviewProvider {

    static var previews: some View {
        NowPlayingPosterView(movie: Movie.first())
    }
}

