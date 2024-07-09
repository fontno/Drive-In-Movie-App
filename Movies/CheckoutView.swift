//
//  CheckoutView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

enum CheckoutState {
    case empty, processing, success, failure
}

struct CheckoutView: View {
    @State var checkoutState: CheckoutState = .empty
    @State var ticket: Ticket!
    var body: some View {
        ZStack {
            
            Image(uiImage: ticket.movie.moviePoster())
                .resizable()
                .scaleEffect(2)
                .saturation(0)
                .overlay(.thinMaterial)
            
            
            Color.indigo
                .opacity(0.4)
                .ignoresSafeArea()
        }
        .overlay {
            
            VStack {
                if checkoutState == .empty {
                    
                    Image(uiImage: ticket.poster)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(32)
                    
                    Button {
                        Task {
                            await checkoutWithCreditCard()
                        }
                    } label: {
                        Label("Pay With Credit Card", systemImage: "creditcard")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                        //                    .foregroundColor(.accentColor)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Button {
                        Task {
                            await checkoutWithGiftCard()
                        }
                    } label: {
                        Label("Pay With Gift Card", systemImage: "giftcard")
                            .imageScale(.large)
                            .symbolRenderingMode(.hierarchical)
                        //                    .foregroundColor(.accentColor)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                
                if checkoutState == .processing {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                
                if checkoutState == .success {
                    Image(systemName: "checkmark")
                        .imageScale(.large)
                        .symbolRenderingMode(.hierarchical)
                }
            }
        }
        
    }
    
    func checkoutWithCreditCard() async {
        
    }
    
    func checkoutWithGiftCard() async {
        
    }
}

struct CheckoutView_Preview: PreviewProvider {

    static var previews: some View {
        CheckoutView(ticket:
            Ticket.all()[0]
         )
    }
}
