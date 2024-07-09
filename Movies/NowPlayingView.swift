//
//  NowPlayingView.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI
import AVKit

struct NowPlayingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var isPlaying: Bool = false

    @State var showTickets: Bool = false
    
    @State var player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "transformers-rise-of-the-beasts-trailer-1_h480p",
                                                                    withExtension: "mov")!)
        
    @State var selectedMovie: Int = 0
    
    
    var playerItems = [AVPlayerItem(url: Bundle.main.url(forResource: "transformers-rise-of-the-beasts-trailer-1_h480p",
                                                                                     withExtension: "mov")!),
                       AVPlayerItem(url: Bundle.main.url(forResource: "the-flash-trailer-1_h480p",
                                                                                     withExtension: "mov")!),
                       AVPlayerItem(url: Bundle.main.url(forResource: "indiana-jones-and-the-dial-of-destiny-trailer-1_h480p",
                                                                                     withExtension: "mov")!)
        ]
    
    var body: some View {
            GeometryReader { geo in
                if (colorScheme == .dark) {
                    Color.black
                        .opacity(1)
                        .ignoresSafeArea()
                } else {
                    Color.white
                        .opacity(1)
                        .ignoresSafeArea()
                }

                ZStack {
                    Color.indigo
                    
                    BackgroundBlur()

                    VStack {
                        VideoPlayer(player: player) {

                        }
                        .aspectRatio(16/9, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .offset(y: 38)
                        .padding()
                        
                        .onAppear {
                            player.play()
                        }
                        .onDisappear {
                            player.pause()
                        }
                        TabView(selection: $selectedMovie) {
                            ZStack {
                                if (colorScheme == .dark) {
                                    Color.black
                                        .opacity(1)
                                } else {
                                    Color.white
                                        .opacity(1)
                                }
                                
                                VStack {
                                    Image(uiImage: Movie.all()[0].moviePoster())
                                        .resizable()
                                        
                                }
                                .padding()
                                .overlay(alignment: .bottom, content: {
                                    CaptionView(movie: Movie.all()[0], isShowing: $showTickets)
                                        
                                })

                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding()
                                .tag(0)
                            
                            ZStack {
                                if (colorScheme == .dark) {
                                    Color.black
                                        .opacity(1)
                                } else {
                                    Color.white
                                        .opacity(1)
                                }
                                
                                VStack {
                                    Image(uiImage: Movie.all()[1].moviePoster())
                                        .resizable()
                                        
                                }
                                .padding()
                                .overlay(alignment: .bottom, content: {
                                    CaptionView(movie: Movie.all()[1], isShowing: $showTickets)
                                        
                                })
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding()
                                .tag(1)
                            
                            ZStack {
                                if (colorScheme == .dark) {
                                    Color.black
                                        .opacity(1)
                                } else {
                                    Color.white
                                        .opacity(1)
                                }
                                
                                VStack {
                                    Image(uiImage: Movie.all()[2].moviePoster())
                                        .resizable()
                                        
                                }
                                .padding()
                                .overlay(alignment: .bottom) {
                                    CaptionView(movie: Movie.all()[2], isShowing: $showTickets)
                                        
                                }
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding()
                                .tag(2)
                        }

                        .tabViewStyle(.page(indexDisplayMode: .always))
                        .onChange(of: selectedMovie) { newValue in
                            player.replaceCurrentItem(with: playerItems[selectedMovie])
                            player.seek(to: .zero)
                            player.play()
                        }

                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.bottom, 16)
                .edgesIgnoringSafeArea([.top])
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}


