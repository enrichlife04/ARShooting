//
//  ARTitleView.swift
//  ARShooting01
//
//  Created by 村中光一 on 2022/12/30.


import SwiftUI
import RealityKit

struct ARTitleView : View {
    
    //@EnvironmentObjectを付与したプロパティは複数のViewでインスタンスを共有できる。
    // つまり、AppDelegateで生成したgameInfo(ゲーム情報)を複数の画面で使用できる。
    @EnvironmentObject var gameInfo: GameInfo
    
    var body: some View {
        
        // ARViewを生成
        let arView = ARViewContainer(gameInfo: gameInfo).edgesIgnoringSafeArea(.all)
        
        let view = ZStack {
            
            // ARViewを表示
            arView
            
            // タイトルボタンを表示
            VStack(spacing: 200) {
                
                if gameInfo.gameState == .menu {
                    // タイトル
                    Text("ARShooting")
                        .font(Font.custom("HelveticaNeue-Bold", size: 60.0))
                }
                
                // ボタン
                Button(action: {
                    self.gameInfo.gameState = .placingContent
                }) {
                    if gameInfo.gameState == .menu {
                        Text("Game Start")
                    }
                }
            }
        }
        
        return view
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    var gameInfo: GameInfo
    
    func makeUIView(context: Context) -> UIView {
        
        return ARShootingView(frame: .zero, gameInfo: gameInfo)
    }
    
    // ARView を UIViewに変更
    func updateUIView(_ uiView: UIView, context: Context) {}
    
}


#if DEBUG
struct ARTitleView_Previews : PreviewProvider {
    static var previews: some View {
        ARTitleView()
    }
}

#endif
