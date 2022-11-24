//
//  VM_PlayerView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 24/11/2022.
//

import AVKit
import SwiftUI


class VM_PlayerView: ObservableObject{
    @Published var player: AVPlayer?
    
    init(){
        generatePlayer()
    }
    
    
    private func generatePlayer(){
        let link = "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"

        guard let url = URL(string: link) else{
            print("\n error: invalid movie url")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play()
    }
}
