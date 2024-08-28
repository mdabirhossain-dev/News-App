//
//  CustomPlayerViewController Extension.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//


import UIKit
import AVFoundation.AVPlayer

extension CustomPlayerViewController {
    @IBAction func playTouched(sender: AnyObject) {
        if (isPlaying) {
            customPlayerView.pause()
        } else {
            customPlayerView.play()
        }
    }
    
    @IBAction func fullScreenTouched(sender: AnyObject) {
        if (!isFullscreen) {
            setPlayerToFullscreen()
        } else {
            setPlayerToNormalScreen()
        }
    }
    
    @IBAction func touchDragInsideSlider(sender: AnyObject) {
        dragginSlider = true
    }
    
    @IBAction func valueChangedSlider(sender: AnyObject) { showControllOnTapped()
        customPlayerView.currentTime = Double(slider.value)
        customPlayerView.play()
        hidePlayerControls(dontAnimate: false)
    }
    
    @IBAction func touchUpInsideSlider(sender: AnyObject) {
        dragginSlider = false
        showControllOnTapped()
    }
    
    func playIndex(index: Int) {
        print("Index \(index)")
        customPlayerView.url = urls![index]
        customPlayerView.play()
        progressIndicatorView.isHidden = false
        progressIndicatorView.startAnimating()
    }
    
    @objc func onTap10SecBack() {
        guard let currentTime = customPlayerView.player?.currentTime() else { return }
        let seekTime10Sec = CMTimeGetSeconds(currentTime).advanced(by: -10)
        let seekTime = CMTime(value: CMTimeValue(seekTime10Sec), timescale: 1)
        customPlayerView.player?.seek(to: seekTime, completionHandler: {[weak self] completed in
            self?.showControllOnTapped()
        })
    }
    
    @objc func onTap10SecNext() {
        guard let currentTime = customPlayerView.player?.currentTime() else { return }
        let seekTime10Sec = CMTimeGetSeconds(currentTime).advanced(by: 10)
        let seekTime = CMTime(value: CMTimeValue(seekTime10Sec), timescale: 1)
        customPlayerView.player?.seek(to: seekTime, completionHandler: {[weak self] completed in
            self?.showControllOnTapped()
        })
    }
    
    private func showControllOnTapped() {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.backPlayerControlsView?.alpha = 0.55
            self.playerControlsView?.alpha = 1.0
            self.play?.alpha = 1.0
            self.img10SecBack?.alpha = 1.0
            self.img10SecFor?.alpha = 1.0
            self.minimizeButton?.alpha = 1.0
            
        }, completion: nil)
        self.hideTimer?.invalidate()
        self.hideTimer = nil
        self.hideTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.hidePlayerControls), userInfo: 1.0, repeats: false)
    }
}

extension CustomPlayerViewController: PlayerViewDelegate {
    func playerVideo(player: PlayerView, statusPlayer: PVStatus, error: NSError?) {
        
        switch statusPlayer {
        case AVPlayer.Status.unknown:
            print("Unknown")
            break
        case AVPlayer.Status.failed:
            print("Failed")
            break
        default:
            readyToPlay()
        }
    }
    
    func readyToPlay() {
        progressIndicatorView.stopAnimating()
        progressIndicatorView.isHidden = true
        playerTapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomPlayerViewController.showPlayerControlsView))
        playerView.addGestureRecognizer(playerTapGesture!)
        print("Ready to Play")
        self.customPlayerView.play()
    }
    
    func playerVideo(player: PlayerView, statusItemPlayer: PVItemStatus, error: NSError?) {
    }
    
    func playerVideo(player: PlayerView, loadedTimeRanges: [PVTimeRange]) {
        if (progressIndicatorView.isHidden == false) {
            progressIndicatorView.stopAnimating()
            progressIndicatorView.isHidden = true
        }
        
        if let first = loadedTimeRanges.first {
            let bufferedSeconds = Float(CMTimeGetSeconds(first.start) + CMTimeGetSeconds(first.duration))
            progress.progress = bufferedSeconds / slider.maximumValue
        }
    }
    
    func playerVideo(player: PlayerView, duration: Double) {
        var durationTime: Int = .zero
        
        if duration.isFinite && !duration.isNaN {
            durationTime = Int(duration)
        }
        self.entireTime.text = timeFormatted(totalSeconds: durationTime)
        slider.maximumValue = Float(durationTime)
    }
    
    func playerVideo(player: PlayerView, currentTime: Double) {
        let curTime = Int(currentTime)
        self.currentTime.text = timeFormatted(totalSeconds: curTime)
        if (!dragginSlider && (Int(slider.value) != curTime)) {
            slider.value = Float(currentTime)
        }
    }
    
    func playerVideo(player: PlayerView, rate: Float) {
        print(rate)
        if (rate == 1.0) {
            isPlaying = true
            play.setImage(UIImage(named: "player_pause"), for: .normal)
            hideTimer?.invalidate()
            showPlayerControlsView()
        } else {
            isPlaying = false
            play.setImage(UIImage(named: "player_play"), for: .normal)
        }
        enableExpandViewFesture()
    }
    
    func playerVideo(playerFinished player: PlayerView) {
        currentUrlIndex += 1
        playIndex(index: currentUrlIndex)
    }
    
    func timeFormatted(totalSeconds: Int) -> String {
        
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    private func enableExpandViewFesture() {
        if (isMinimized) {
            if let playerGesture = self.playerTapGesture {
                self.playerView.removeGestureRecognizer(playerGesture)
            }
            self.playerTapGesture = nil
            self.playerTapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomPlayerViewController.expandViews))
            self.playerView.addGestureRecognizer(self.playerTapGesture!)
        }
    }
}
