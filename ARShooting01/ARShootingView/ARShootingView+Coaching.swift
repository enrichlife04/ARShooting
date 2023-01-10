//
//  ARShootingView+Coaching.swift
//  ARShooting01
//
//  Created by 村中光一 on 2023/01/09.
//

import ARKit

// ARCoachingOverlayViewDelegateプロトコルに準拠し、コーチングオーバーレイビューのイベントを管理する
extension ARShootingView: ARCoachingOverlayViewDelegate {
    
    // コーチングオーバーレイビュー追加
    func addCoachingOverlayView() {
        
        // 平面検出中の場合に、スリープ状態に移行されるのを防ぐ
        UIApplication.shared.isIdleTimerDisabled = true
        
        coachingOverlayView.session = arView.session
        coachingOverlayView.delegate = self
        coachingOverlayView.goal = .horizontalPlane
        coachingOverlayView.setActive(true, animated: true)
        
        // コーチングオーバーレイビューをarViewに追加
        arView.addSubview(coachingOverlayView)
    }
    
    // コーチングオーバーレイビューが完了すると呼ばれる
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        
        // 自動ロックされるようになる
        UIApplication.shared.isIdleTimerDisabled = false
        
        // 多分これがコーチングビュー消してる
        coachingOverlayView.activatesAutomatically = false
        coachingOverlayView.setActive(false, animated: false)
        coachingOverlayView.delegate = nil
        coachingOverlayView.removeFromSuperview()
        
        startGame()
    }
}
