//
//  Test.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI
import AVFoundation

struct covervideo: UIViewRepresentable {
   func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<covervideo>) {
   }

   func makeUIView(context: Context) -> UIView {
     return PlayerUIView(frame: .zero)
   }
 }


class PlayerUIView: UIView {
   private var playerLooper: AVPlayerLooper?
   private var playerLayer = AVPlayerLayer()
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

   override init(frame: CGRect) {
       super.init(frame: frame)
       // Load the resource
       let fileUrl = Bundle.main.url(forResource: "sample_video", withExtension: "mp4")!
       let asset = AVAsset(url: fileUrl)
       let item = AVPlayerItem(asset: asset)
       
       // Setup the player
       let player = AVQueuePlayer()
       playerLayer.player = player
       playerLayer.videoGravity = .resizeAspectFill
       layer.addSublayer(playerLayer)
        
       // Create a new player looper with the queue player and template item
       playerLooper = AVPlayerLooper(player: player, templateItem: item)

       // Start the movie
       player.play()
   }

   override func layoutSubviews() {
           super.layoutSubviews()
           playerLayer.frame = bounds
   }
}
struct Test: View {
    
    var player: AVPlayer {
        // Load the video file from the app bundle
        let fileUrl = Bundle.main.url(forResource: "sample_video", withExtension: "mp4")!
        return AVPlayer(url: fileUrl)
    }
    
    
    // MARK: Stored properties
    
    // Access the book state through the environment
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            
                   covervideo()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Test()
}
