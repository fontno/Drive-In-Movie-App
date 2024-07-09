//
//  TheatreTicketView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct TheatreTicketView: View {
    @Binding var isShowing: Bool
    
    @State var movie: Movie
    @State var theatre: Theatre
    @State var tickets: [Ticket]
    @State var ticketSelection: Ticket?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
      
                    BackgroundBlur()
                    
                    VStack {
                        HStack {
                            Text(movie.title)
                                .font(.headline)
                                .lineLimit(1)
                        }
                        .padding()
                        
                        Spacer()
                        
                        MovieScreen()
                        
                        LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: geo.size.width/CGFloat(theatre.seatPerRowCount))), count: theatre.seatPerRowCount)) {
                            ForEach(tickets) { ticket in
                                Image(systemName: ticket.sold ? "car.circle.fill" : "car.circle")
                                    .imageScale(.large)
                                    .padding(.horizontal, 4)
                                    .foregroundColor(Color.blue)
                                    .opacity(ticket.sold ? 0.4 : 1.0)
                                    
                                    .onTapGesture {
                                        ticketSelection = ticket
                                    }
                                    .disabled(ticket.sold ? true : false)
                                    .overlay {
                                        ticket == ticketSelection ?
                                            Image(systemName: "car.circle")
                                                .imageScale(.large)
                                                .padding(.horizontal, 4)
                                                .foregroundColor(Color.white)
                                        :
                                            nil
                                    }
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text(ticketSelection?.price.toDollars().format() ?? 0.toDollars().format())
                                .font(.largeTitle)
                                .padding()
                            Spacer()
                            
                            NavigationLink {
                                CreditCardFormView(isShowing: $isShowing, ticket: ticketSelection, theatre: theatre)
                            } label: {
                                Text("Continue")
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                            .disabled(ticketSelection != nil ? false : true)
                            
                        }
                        .padding()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Label {
                                Text("close")
                            } icon: {
                                Image(systemName: "xmark")
                            }
                            .labelStyle(.iconOnly)
                        }
                        
                    }
                }
            }
        }
    }
}
struct TheatreTicketView_Previews: PreviewProvider {

    static var previews: some View {
        TheatreTicketView(isShowing: .constant(false), movie: Movie.all()[0], theatre: Theatre(id: UUID(), name: "Parkland Drive In"), tickets: Ticket.random())
    }
}
