//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jozef Forgac on 11/02/2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var viewmodel = MemorizeEmojiGame()
    
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: viewmodel)
        }
    }
}
