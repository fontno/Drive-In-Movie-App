//
//  WalletTicketView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct WalletTicketView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var ticket: Ticket
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black)
                    .foregroundColor(.clear)
                    .overlay(alignment: .top) {
                        VStack {
                            Image(uiImage: ticket.poster)
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(2/3, contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(alignment: .bottom) {
                                    ZStack {
                                        
                                        CaptionBackgroundView()
                                        
                                            HStack {
                                                VStack {
                                                    Text(ticket.date.formatText())
                                                }
                                                Spacer()
                                                VStack {
                                                    Text("row")
                                                    Text(String(ticket.row))
                                                }
                                                VStack {
                                                    Text("Seat")
                                                    Text(String(ticket.seat))
                                                }
                                                
                                            }
                                            .padding()
                                    }
                                    .aspectRatio(4/1, contentMode: .fit)
                                }
                            VStack {
                                BarcodeView(string: ticket.barcodeString)
                                    .colorInvert()
                                    .frame(height: 80)
                                    .scaledToFill()
                                    .padding()
                                Text(ticket.barcodeString)
                            }
                        }
                        .padding(16)
                    }
                    .background(in: RoundedRectangle(cornerRadius: 8))
                    .padding(32)
            }
            .frame(height: geo.size.height-80)
        }
    }
}
