//
//  Movie.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation
import AVKit

struct Movie: Codable, Identifiable {
    let id: UUID
    let title: String
    let displayTitle: String
    let rating: MovieRating
    let poster: String
    let posterExtension: String
    let trailer: String
    let trailerExtension: String
    let releaseDate: String // TODO: proper Date
    var likes: UInt
    
    static func all() -> [Movie] {
        let movies = [Movie(id: UUID(), title: "Transformers Rise of the Beast", displayTitle: "Transformers", rating: .pg13, poster: "transformers-rise-of-the-beasts", posterExtension: "jpeg", trailer: "transformers-rise-of-the-beast-1_h480p", trailerExtension: "mov", releaseDate: "June 9, 2023", likes: 75),
                        Movie(id: UUID(), title: "Indiana Jones and the Dial of Destiny", displayTitle: "Indiana Jones", rating: .pg13, poster: "indiana-jones-and-the-dial-of-destiny", posterExtension: "jpeg", trailer: "indiana-jones-and-the-dial-of-destiny-trailer-1_h480p", trailerExtension: "mov", releaseDate: "June 30, 2023", likes: 90),
                      Movie(id: UUID(), title: "The Flash", displayTitle: "The Flash", rating: .pg13, poster: "the-flash",  posterExtension: "jpeg", trailer: "the-flash-1_h480p", trailerExtension: "mov", releaseDate: "June 16, 2023", likes: 50)
                      ]
        return movies
                            
    }
    
    static func first() -> Movie {
        return all().first!
    }
    
    func moviePlayer() -> AVPlayer {
        return AVPlayer(url: Bundle.main.url(forResource: trailer, withExtension: trailerExtension)!)
    }
    
    func moviePoster() -> UIImage {
        let path = Bundle.main.path(forResource: poster, ofType: posterExtension)!
        return UIImage(contentsOfFile: path)!
    }
 
}
