//
//  ContentView.swift
//  Movies
//
//  Created by Brian Fontenot on 12/5/22.
//

import SwiftUI
import AVFoundation
import AVKit


struct ContentView: View {
    
    @State var selection: Int = 1
    
    var body: some View {
     
        TabView(selection: $selection) {
            
            NowPlayingView()
                .tabItem {
                    Label("", systemImage: "film.stack.fill")
                }
                .tag(1)
            
            WalletView()
                .tabItem {
                    Label("", systemImage: "ticket.fill")
                }
                .tag(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

