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
    @State private var scale = 1.0
    var body: some View {
        
            VStack {
                
            
                    ZStack{
                        
                        covervideo()
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack{
                            // Show the cover
                            Text("Journey Under the Sea")
                                .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.68, green: 0.85, blue: 0.90)) // Light pastel blue color
                                   
                            
                            
                            Button(action: {
                                book.beginReading()
                                scale += 1
                                   }) {
                                       Text("Begin Story")
                                           .font(.title) 
                                           .foregroundColor(.white)
                                           .padding()
                                           .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.69, green: 0.87, blue: 1.0), Color(red: 0.46, green: 0.76, blue: 1.0)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                         .cornerRadius(25)
                                           .scaleEffect(scale)
                                                  .animation(.linear(duration: 1), value: scale)
                                                 
                                           
                                   }
                                
                            
                                  
                               
                          
                        }
                        
                    
                    
                    
                }
                

                
            }
            
        }
    }


#Preview {
    CoverView()
}
