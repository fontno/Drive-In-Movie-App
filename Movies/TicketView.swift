//
//  TicketView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/28/23.
//

import SwiftUI

struct TicketView: View {
    @Environment(\.colorScheme) var colorScheme
    var ticket: Ticket
    
    var theatre: Theatre
    
    @State var padding: CGFloat = 16
    
//    @Environment(\.dismiss) var dismiss
    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                BackgroundBlur()
                
                VStack {
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
                    
                    
                    
                    Button {
                        // Dismiss full screen cover back to tab view wallet
                        isShowing = false
                        
                    } label: {
                        HStack {
                            Image(systemName: "wallet.pass")
                            Text("Add To Wallet")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct TicketView_Preview: PreviewProvider {
    
    static var previews: some View {
        TicketView(ticket: Ticket.all().first!, theatre: Theatre(id: UUID(), name: "Parkland Drive In"), isShowing: .constant(false))
    }
}

