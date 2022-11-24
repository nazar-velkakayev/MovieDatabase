//
//  PlayerView.swift
//  MovieDatabase
//
//  Created by Belli's MacBook on 24/11/2022.
//

import SwiftUI
import AVKit


struct PlayerView: View {
    @StateObject private var vm_playerView = VM_PlayerView()
    
    var body: some View {
        ZStack{
            VideoPlayer(player: vm_playerView.player)

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
