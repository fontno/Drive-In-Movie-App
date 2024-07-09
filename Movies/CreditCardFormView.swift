//
//  CreditCardFormView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/28/23.
//

import SwiftUI

struct CreditCardFormView: View {
    
    @Binding var isShowing: Bool
    
    enum FormField: Hashable {
        case name
        case cardNumber
        case expiration
        case security
    }
    
    @FocusState private var isFocused: FormField?
    @State private var name = ""
    @State private var cardNumber = ""
    @State private var expiration = ""
    @State private var security = ""
    @State private var isProcessing = false
    @State private var showTicket = false

    @State var ticket: Ticket!
    @State var theatre: Theatre
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                BackgroundBlur()
                
                VStack {
                    Form {

                        Section {
                            
                            TextField("name", text: $name)
                                .focused($isFocused, equals: .name)
                                .keyboardType(.namePhonePad)
                            TextField("card number", text: $cardNumber)
                                .focused($isFocused, equals: .cardNumber)
                                .keyboardType(.numberPad)
                            TextField("expiration date", text: $expiration)
                                .focused($isFocused, equals: .expiration)
                                .keyboardType(.numbersAndPunctuation)
                            TextField("security code", text: $security)
                                .focused($isFocused, equals: .security)
                                .keyboardType(.numberPad)
                        } footer: {
                            // TODO: Validate message
                            

                        }
                        .listRowSeparatorTint(.blue, edges: .all)
                        .listRowBackground(Color.clear)
                    }
                    .padding()
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .navigationTitle(Text("Credit Card"))
                    
                    NavigationLink {
                        TicketView(ticket: ticket, theatre: theatre, isShowing: $isShowing)
//                        WalletTicket(ticket: ticket)
                    } label: {
                        HStack{
                            Image(systemName: "creditcard")
                            Text("Pay")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!isValid)
                
                }
                .overlay {
                    isProcessing ?
                        ProgressView {
                            Text("Processing...")
                        }
                    :
                        nil
                }
                
            }
        }
    }
    
    func process() {
        // TODO:
        isProcessing.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isProcessing.toggle()
        }
        
        showTicket.toggle()
    }
    
    func processCreditCard() async {
        // TODO:
        isProcessing.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isProcessing.toggle()
        }
        
        showTicket.toggle()
        
    }
    
    var isValid: Bool {
        return !(name.isEmpty) && !(cardNumber.isEmpty) && !(expiration.isEmpty) && !(security.isEmpty) && (security.count == 3)
    }
    
    func validateFields() {
        if name.isEmpty {
            isFocused = .name
        } else if cardNumber.isEmpty {
            isFocused = .cardNumber
        }
        else if expiration.isEmpty {
            isFocused = .expiration
        }
        else if security.isEmpty {
            isFocused = .security
        }
    }
    
}

struct CreditCardFormView_Preview: PreviewProvider {
    
    static var previews: some View {
        CreditCardFormView(isShowing: .constant(false), ticket: Ticket.all().first!, theatre: Theatre.first())
    }
}

