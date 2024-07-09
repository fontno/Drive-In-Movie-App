//
//  TheatreView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct TheatreView: View {
    @State var movie: Movie
    @State var theatre: Theatre
    @State var tickets: [Ticket]
    @State var ticketSelection: Ticket?
    
    var body: some View {
        GeometryReader { geo in
            
                PosterBlur(movie: movie)
                
                VStack {
                    
                    Text(theatre.name)
                        .font(.headline)
                        .padding()
                    
                    PerspectiveScreenView()
                        .frame(width: geo.size.width, height: 100)
                        .layoutPriority(1)
                        .offset(y: -30)
                 
                    LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: geo.size.width/CGFloat(theatre.seatPerRowCount))), count: theatre.seatPerRowCount)) {
                        ForEach(tickets) { ticket in
                            Image(systemName: ticket.sold ? "car.circle.fill" : "car.circle")
                                .imageScale(.large)
                                .padding(.horizontal, 4)
                                .foregroundColor(.accentColor)
                                .onTapGesture {
                                    ticketSelection = ticket
                                }
                        }
                    }
                .sheet(item: $ticketSelection) { ticketSelection in
                    CheckoutView(ticket: ticketSelection)
                }
            }
       
        }
    }
}

struct TheatreView_Preview: PreviewProvider {

    static var previews: some View {
        TheatreView(movie: Movie.all()[0], theatre: Theatre(id: UUID(), name: "Parkland Drive In"), tickets: Ticket.all())
    }
}
