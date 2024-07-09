//
//  RatingsView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct RatingsView: View {
    var stars: Int
    var possibleStars: Int = 5
    
    var body: some View {
        HStack {
            ForEach(0..<possibleStars, id: \.self) { star in
                star < stars ?
                Image(systemName: "star.fill")
                    .foregroundColor(.pink)
                :
                Image(systemName: "star")
                    .foregroundColor(.pink)

            }
        }
    }
}
struct RatingsView_Previews: PreviewProvider {

    static var previews: some View {
      RatingsView(stars: 3)
    }
}
