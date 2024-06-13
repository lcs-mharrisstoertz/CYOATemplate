//
//  CoverView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI
import AVFoundation

struct CoverView: View {
    
    var player: AVPlayer {
        //loads the video from the app
        let fileUrl = Bundle.main.url(forResource: "sample_video", withExtension: "mp4")!
        return AVPlayer(url: fileUrl)
    }
    
    
    
    // MARK: Stored properties
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // MARK: Computed properties
    
    var body: some View {
        
        if book.isNotReadyToRead {
            
            ProgressView()
            
        } else {
            VStack {
                
                if book.isNotReadyToRead {
                    
                    ProgressView()
                    
                } else {
                    ZStack{
                        
                        covervideo()
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack{
                            // Show the cover
                            Text("Journey Under the Sea")
                                .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.68, green: 0.85, blue: 0.90)) // Light pastel blue color
                                        .padding()
                            
                            Button {
                                // Animate page changes (fade)
                                
                                book.beginReading()
                                
                            } label: {
                                Text("Begin reading")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        
                    }
                    
                    
                }
                
                
            }
            
        }
    }
}

#Preview {
    CoverView()
}
