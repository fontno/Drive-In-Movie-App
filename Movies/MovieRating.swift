//
//  MovieRating.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation

enum MovieRating: String, Identifiable, Codable {
    case g, pg, pg13, r
    
    var id: Self {
        return self
    }
}
