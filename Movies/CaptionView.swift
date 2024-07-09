//
//  CaptionView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct CaptionView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var movie: Movie
    @Binding var isShowing: Bool
    
    var body: some View {
        
        CaptionBackgroundView()
            .aspectRatio(5/2, contentMode: .fit)
            .overlay() {
                VStack {
                    Spacer()
                    HStack {
                        RatingsView(stars: 4)
                            .padding(2)
                        Spacer()
                        
                        Button {
                            isShowing.toggle()
                        } label: {
                            Label {
                                Text("Buy Ticket")
                            } icon: {
                                Image(systemName: "ticket.fill")
                            }

                        }
                        .buttonStyle(.bordered)
                        .padding([.trailing], 16)
                    }
                    .padding()
                    .offset(y: -20)
                    
                }
                .padding([.leading], 16)
            }
            .fullScreenCover(isPresented: $isShowing) {
                // TODO:
                TheatreTicketView(isShowing: $isShowing, movie: movie, theatre: Theatre.first(), tickets: Ticket.random())
            }

    }
}

struct CaptionView_Previews: PreviewProvider {

    static var previews: some View {
        CaptionView(movie: Movie.first(), isShowing: .constant(false))
    }
}

