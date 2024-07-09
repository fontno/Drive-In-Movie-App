//
//  WalletTicket.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct WalletTicket: View {
    @Environment(\.colorScheme) var colorScheme
    @State var ticket: Ticket
    var body: some View {
        VStack(spacing: 2) {
            Spacer()
            
            ZStack {
                if (colorScheme == .dark) {
                    Color.black
                        .opacity(1)
                } else {
                    Color.white
                        .opacity(1)
                }
                
                Image(uiImage: ticket.poster)
                    .resizable()
                    .scaledToFill()
                    .padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding([.top, .leading, .trailing], 16)
            
            ZStack {
                if (colorScheme == .dark) {
                    Color.black
                        .opacity(1)
                } else {
                    Color.white
                        .opacity(1)
                }
                
                VStack {
                    Text(ticket.movie.title)
                        .font(.headline)
                        .lineLimit(1)
                    HStack {
                        Spacer()
                        VStack {
                            Text(ticket.date.formatDate())
                                .font(.caption)
                            Text(ticket.date.formatTime())
                                .font(.caption)
                        }
                        Spacer()
                        VStack {
                            Text("row")
                                .font(.caption)
                            Text(String(ticket.row))
                                .font(.caption)
                        }
                        VStack {
                            Text("Seat")
                                .font(.caption)
                            Text(String(ticket.seat))
                                .font(.caption)
                        }
                        Spacer()
                    }
                    if colorScheme == .dark {
                        BarcodeView(string: ticket.barcodeString)
                            .colorInvert()
                            .frame(height: 80)
                            .scaledToFill()
                            .padding()
                    } else {
                        BarcodeView(string: ticket.barcodeString)
                        .frame(height: 80)
                        .scaledToFill()
                        .padding()
                    }
                    
                    Text(ticket.barcodeString)
                        .font(.callout)
                }
                .padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding([.bottom, .leading, .trailing], 16)
            
            Spacer()
        }
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, 16)
    }
}
