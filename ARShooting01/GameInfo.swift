//
//  GameInfo.swift
//  ARShooting01
//
//  Created by 村中光一 on 2023/01/03.
//

import SwiftUI

enum GameState {
    
    // ゲームメニューを表示しています
    case menu
    
    // 現実世界の平面を探しています
    case placingContent
    
    // ステージ１を表示しています
    case stage1
    
    // ステージ２を表示しています
    case stage2
    
    // ゲーム終了
    case endGame
}

final class GameInfo: ObservableObject {
    @Published var gameState: GameState = .menu
}
