//
//  WalletView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct WalletView: View {
    @State var tickets: [Ticket] = Ticket.examples()
    @State var selectedTicket: Int = 0
    
    var body: some View {

        NavigationStack {
            GeometryReader { geo in
                Color.black
                    .opacity(1)
                    .ignoresSafeArea()
                
                ZStack {
                    Color.indigo
                    
                    BackgroundBlur()
                    
                    VStack {
                        tickets.isEmpty ?
                            Group {
                                Text("What are you waiting for!")
                                    .font(.headline)
                                    .padding()
                                Text("🥤").font(.subheadline) +
                                Text("😎").font(.headline) +
                                Text("🍿").font(.subheadline)
                            }
                            .scaleEffect(1.5)
                        :
                            nil
                        
                        
                            TabView(selection: $selectedTicket) {
                                WalletTicket(ticket: tickets[0])
                                    .tag(0)
                                WalletTicket(ticket: tickets[2])
                                    .tag(1)
                            }
                            .tabViewStyle(.page(indexDisplayMode: .always))
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.bottom, 16)
                .edgesIgnoringSafeArea([.top])
            }
    }
}


struct WalletView_Previews: PreviewProvider {

    static var previews: some View {
        WalletView()
    }
}
