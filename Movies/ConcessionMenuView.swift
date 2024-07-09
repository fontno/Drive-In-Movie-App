//
//  ConcessionMenuView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/28/23.
//

import SwiftUI

struct ConcessionMenuView: View {
    @State var tickets: [Ticket] = Ticket.examples()
    @State var selectedTicket: Int = 0
    @State var menuItems: [MenuItem] = Menu.all()
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
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.fixed(geo.size.width / 2)), GridItem(.fixed(geo.size.width / 2))]) {
                                ForEach(menuItems) { item in
                                    Image(uiImage: item.poster())
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fill)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay {
                                            CaptionBackgroundView()
                                                .overlay(alignment: .bottom) {
                                                    Text(item.name)
                                                        .font(.headline)
                                                }
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                        }

                        }
       
                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.bottom, 16)
                .edgesIgnoringSafeArea([.top])
               
            }
    }
}

struct ConcessionMenuView_Previews: PreviewProvider {

    static var previews: some View {
        ConcessionMenuView()
    }
}
