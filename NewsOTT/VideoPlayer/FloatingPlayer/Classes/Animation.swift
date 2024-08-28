//
//  Animation.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//

import UIKit

enum UIPanGestureRecognizerDirection {
    case Undefined
    case Up
    case Down
    case Left
    case Right
}

extension CustomPlayerViewController {
    
    // MARK: - Player Controls Animations
    @objc func showPlayerControlsView() {
        if (!isMinimized) {
            if play.alpha == .zero {
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                    [self.backPlayerControlsView,
                     self.playerControlsView,
                     self.play,
                     self.img10SecBack,
                     self.img10SecFor,
                     self.minimizeButton].forEach { element in
                        element?.alpha = 1.0
                    }
                }, completion: nil)
                hideTimer?.invalidate()
                hideTimer = nil
                hideTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(hidePlayerControls), userInfo: 1.0, repeats: false)
                
            } else {
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                    [self.backPlayerControlsView,
                     self.playerControlsView,
                     self.play,
                     self.img10SecBack,
                     self.img10SecFor,
                     self.minimizeButton].forEach { element in
                        element?.alpha = .zero
                    }
                }, completion: nil)
            }
        }
    }
    
    @objc func hidePlayerControls(dontAnimate: Bool) {
        if (dontAnimate) {
            [self.backPlayerControlsView,
             self.playerControlsView,
             self.play,
             self.img10SecBack,
             self.img10SecFor].forEach { element in
                element?.alpha = .zero
            }
        } else {
            if (isPlaying) {
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseIn, animations: {
                    [self.backPlayerControlsView,
                     self.playerControlsView,
                     self.play,
                     self.img10SecBack,
                     self.img10SecFor,
                     self.minimizeButton].forEach { element in
                        element?.alpha = .zero
                    }
                }, completion: nil)
            }
        }
    }
    
    // MARK: - Video Animations
    func setPlayerToFullscreen() {
        self.hidePlayerControls(dontAnimate: true)
        customPlayerView.backgroundColor = .black
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
            self.minimizeButton?.isHidden = true
            self.playerView.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
            self.customPlayerView.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
            
            self.playerView.frame = CGRectMake(self.initialFirstViewFrame!.origin.x, self.initialFirstViewFrame!.origin.x, self.initialFirstViewFrame!.size.width, self.initialFirstViewFrame!.size.height)
            self.customPlayerView.frame = CGRectMake(self.initialFirstViewFrame!.origin.x, self.initialFirstViewFrame!.origin.x, self.initialFirstViewFrame!.size.width, self.initialFirstViewFrame!.size.height)
            
        }, completion: { finished in
            self.isFullscreen = true
            self.fullscreen.setImage(UIImage(named: "unfullscreen@2x"), for: .normal)
            
            let originY = self.initialFirstViewFrame!.size.width - self.playerControlsFrame!.height
            
            self.backPlayerControlsView.frame.origin.x = self.initialFirstViewFrame!.origin.x
            self.backPlayerControlsView.frame.origin.y = originY
            self.backPlayerControlsView.frame.size.width = self.initialFirstViewFrame!.size.height
            
            self.playerControlsView.frame.origin.x = self.initialFirstViewFrame!.origin.x
            self.playerControlsView.frame.origin.y = originY
            self.playerControlsView.frame.size.width = self.initialFirstViewFrame!.size.height
            self.showPlayerControlsView()
        })
        // FIXME: - Status bar hide here
        UIApplication.shared.isStatusBarHidden = true
    }
    
    func setPlayerToNormalScreen() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
            self.playerView.transform = CGAffineTransformMakeRotation(0)
            self.customPlayerView.transform = CGAffineTransformMakeRotation(0)
            
            self.playerView.frame = CGRectMake(self.playerViewFrame!.origin.x, self.playerViewFrame!.origin.x, self.playerViewFrame!.size.width, self.playerViewFrame!.size.height)
            self.customPlayerView.frame = CGRectMake(self.playerViewFrame!.origin.x, self.playerViewFrame!.origin.x, self.playerViewFrame!.size.width, self.playerViewFrame!.size.height)
            
            let originY = self.playerViewFrame!.size.height - self.playerControlsFrame!.height
            self.backPlayerControlsView.frame.origin.x = self.initialFirstViewFrame!.origin.x
            self.backPlayerControlsView.frame.origin.y = originY
            self.backPlayerControlsView.frame.size.width = self.playerViewFrame!.size.width
            
            self.playerControlsView.frame.origin.x = self.initialFirstViewFrame!.origin.x
            self.playerControlsView.frame.origin.y = originY
            self.playerControlsView.frame.size.width = self.playerViewFrame!.size.width
            
        }, completion: { finished in
            self.isFullscreen = false
            self.minimizeButton.isHidden = false
            self.fullscreen.setImage(UIImage(named: "fullscreen"), for: .normal)
        })
    }
    
    @objc func panAction(recognizer: UIPanGestureRecognizer) {
        if (!isFullscreen) {
            let yPlayerLocation = recognizer.location(in: self.view?.window).y
            
            switch recognizer.state {
            case .began:
                onRecognizerStateBegan(yPlayerLocation: yPlayerLocation, recognizer: recognizer)
                break
            case .changed:
                onRecognizerStateChanged(yPlayerLocation: yPlayerLocation, recognizer: recognizer)
                break
            default:
                onRecognizerStateEnded(yPlayerLocation: yPlayerLocation, recognizer: recognizer)
            }
        }
    }
    
    func onRecognizerStateBegan(yPlayerLocation: CGFloat, recognizer: UIPanGestureRecognizer) {
        collectionViewContainer.backgroundColor = .clear
        hidePlayerControls(dontAnimate: true)
        panGestureDirection = UIPanGestureRecognizerDirection.Undefined
        
        let velocity = recognizer.velocity(in: recognizer.view)
        detectPanDirection(velocity: velocity)
        
        touchPositionStartY = recognizer.location(in: self.playerView).y
        touchPositionStartX = recognizer.location(in: self.playerView).x
    }
    
    func onRecognizerStateChanged(yPlayerLocation: CGFloat, recognizer: UIPanGestureRecognizer) {
        if (panGestureDirection == UIPanGestureRecognizerDirection.Down ||
            panGestureDirection == UIPanGestureRecognizerDirection.Up) {
            let trueOffset = yPlayerLocation - touchPositionStartY!
            let xOffset = trueOffset * 0.35
            adjustViewOnVerticalPan(yPlayerLocation: yPlayerLocation, trueOffset: trueOffset, xOffset: xOffset, recognizer: recognizer)
            customPlayerView.backgroundColor = .clear
            customPlayerView.layer.borderWidth = .zero
        } else {
            adjustViewOnHorizontalPan(recognizer: recognizer)
        }
    }
    
    func onRecognizerStateEnded(yPlayerLocation: CGFloat, recognizer: UIPanGestureRecognizer) {
        if (panGestureDirection == UIPanGestureRecognizerDirection.Down ||
            panGestureDirection == UIPanGestureRecognizerDirection.Up) {
            customPlayerView.backgroundColor = .clear
            customPlayerView.layer.borderWidth = .zero
            if (self.view.frame.origin.y < 0) {
                expandViews()
                recognizer.setTranslation(CGPointZero, in: recognizer.view)
                return
                
            } else {
                if (self.view.frame.origin.y > (initialFirstViewFrame!.size.height / 2)) {
                    minimizeViews()
                    recognizer.setTranslation(CGPointZero, in: recognizer.view)
                    return
                } else {
                    expandViews()
                    recognizer.setTranslation(CGPointZero, in: recognizer.view)
                }
            }
            
        } else if (panGestureDirection == UIPanGestureRecognizerDirection.Left) {
            if (collectionViewContainer.alpha <= 0) {
                if (self.view?.frame.origin.x ?? .zero < 0) {
                    removeViews()
                    
                } else {
                    animateViewToRightOrLeft(recognizer: recognizer)
                }
            }
            
        } else {
            if (collectionViewContainer.alpha <= 0) {
                if (self.view?.frame.origin.x ?? .zero > initialFirstViewFrame!.size.width - 50) {
                    removeViews()
                    
                } else {
                    animateViewToRightOrLeft(recognizer: recognizer)
                    
                }
            }
        }
    }
    
    func detectPanDirection(velocity: CGPoint) {
        minimizeButton.isHidden = true
        let isVerticalGesture = abs(velocity.y) > abs(velocity.x)
        
        if (isVerticalGesture) {
            
            if (velocity.y > 0) {
                panGestureDirection = UIPanGestureRecognizerDirection.Down
            } else {
                panGestureDirection = UIPanGestureRecognizerDirection.Up
            }
            
        } else {
            
            if (velocity.x > 0) {
                panGestureDirection = UIPanGestureRecognizerDirection.Right
            } else {
                panGestureDirection = UIPanGestureRecognizerDirection.Left
            }
        }
    }
    
    func adjustViewOnVerticalPan(yPlayerLocation: CGFloat, trueOffset: CGFloat, xOffset: CGFloat, recognizer: UIPanGestureRecognizer) {
        
        self.customPlayerFrame?.size.width =  self.view.bounds.size.width - xOffset
        self.customPlayerFrame?.origin.x = xOffset + 6
        self.customPlayerFrame?.origin.y = .zero
        
        if (Float(trueOffset) >= (restrictTrueOffset! + 60) ||
            Float(xOffset) >= (restrictOffset! + 60)) {
            
            let trueOffset = initialFirstViewFrame!.size.height - 100
            let xOffset = initialFirstViewFrame!.size.width - 160
            
            //Use this offset to adjust the position of your view accordingly
            viewMinimizedFrame?.origin.y = trueOffset
            viewMinimizedFrame?.origin.x = xOffset - 6
            viewMinimizedFrame?.size.width = initialFirstViewFrame!.size.width
            
            playerViewMinimizedFrame!.size.width = self.view.bounds.size.width - xOffset
            playerViewMinimizedFrame!.size.height = 200 - xOffset * 0.5
            
            UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveEaseInOut, animations: {
                self.playerView.frame = self.customPlayerFrame!
                self.customPlayerView.frame = self.customPlayerFrame!
                self.view.frame = self.viewMinimizedFrame!
                self.collectionViewContainer.alpha = 0.0
            }, completion: { finished in
                self.isMinimized = true
            })
            recognizer.setTranslation(CGPointZero, in: recognizer.view)
            
        } else {
            //Use this offset to adjust the position of your view accordingly
            viewMinimizedFrame?.origin.y = trueOffset
            viewMinimizedFrame?.origin.x = .zero
            viewMinimizedFrame?.size.width = initialFirstViewFrame!.size.width
            
            playerViewMinimizedFrame?.origin.x = .zero
            playerViewMinimizedFrame?.origin.y = .zero
            playerViewMinimizedFrame!.size.width =  initialFirstViewFrame!.size.width
            playerViewMinimizedFrame!.size.height = 200 - xOffset * 0.5
            
            let restrictY = initialFirstViewFrame!.size.height - playerView!.frame.size.height - 10
            
            if (self.collectionViewHolder.frame.origin.y < restrictY && self.collectionViewHolder.frame.origin.y > 0) {
                UIView.animate(withDuration: 0.09, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.playerView.frame = self.customPlayerFrame!
                    self.customPlayerView.frame = self.customPlayerFrame!
                    self.view.frame = self.viewMinimizedFrame!
                    
                    let percentage = (yPlayerLocation + 200) / self.initialFirstViewFrame!.size.height
                    self.collectionViewContainer.alpha = 1.0
                    self.transparentView!.alpha = 1.0 - percentage
                    
                }, completion: { finished in
                    if (self.panGestureDirection == UIPanGestureRecognizerDirection.Down) {
                        self.onView?.bringSubviewToFront(self.view)
                    }
                })
                
            } else if (viewMinimizedFrame!.origin.y < restrictY && viewMinimizedFrame!.origin.y > 0) {
                UIView.animate(withDuration: 0.09, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.playerView.frame = self.customPlayerFrame!
                    self.customPlayerView.frame = self.customPlayerFrame!
                    self.view.frame = self.viewMinimizedFrame!
                    
                }, completion: nil)
            }
            
            recognizer.setTranslation(CGPointZero, in: recognizer.view)
        }
    }
    
    func adjustViewOnHorizontalPan(recognizer: UIPanGestureRecognizer) {
        let x = self.view.frame.origin.x
        
        if (panGestureDirection == UIPanGestureRecognizerDirection.Left) {
            if (self.collectionViewContainer.alpha <= 0) {
                let velocity = recognizer.velocity(in: recognizer.view)
                
                let isVerticalGesture = abs(velocity.y) > abs(velocity.x)
                
                let translation = recognizer.translation(in: self.view)
                self.view?.center = CGPointMake(self.view!.center.x + translation.x, self.view!.center.y)
                
                if (!isVerticalGesture) {
                    recognizer.view?.alpha = detectHorizontalPanRecognizerViewAlpha(x: x, velocity: velocity, recognizer: recognizer)
                }
                recognizer.setTranslation(CGPointZero, in: recognizer.view)
            }
            
        }
    }
    
    func detectHorizontalPanRecognizerViewAlpha(x: CGFloat, velocity: CGPoint, recognizer: UIPanGestureRecognizer) -> CGFloat {
        let percentage = x / self.initialFirstViewFrame!.size.width
        
        if (panGestureDirection == UIPanGestureRecognizerDirection.Left) {
            return percentage
            
        } else {
            if (velocity.x > 0) {
                return 1.0 - percentage
            } else {
                return percentage
            }
        }
    }
    
    func animateViewToRightOrLeft(recognizer: UIPanGestureRecognizer) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.frame = self.viewMinimizedFrame!
            self.playerView!.frame = self.playerViewFrame!
            self.playerView.frame = CGRectMake(self.playerView!.frame.origin.x, self.playerView!.frame.origin.x, self.playerViewMinimizedFrame!.size.width, self.playerViewMinimizedFrame!.size.height)
            self.collectionViewContainer!.alpha = 0.0
            self.transparentView?.alpha = 0.0
            self.playerView.alpha = 1.0
            self.customPlayerView.alpha = 1.0
            
        }, completion: { finished in
            self.minimizeViews()
        })
        
        recognizer.setTranslation(CGPointZero, in: recognizer.view)
    }
    
    func minimizeViews(isMinimise: Bool = false) {
        self.img10SecBack.isHidden = true
        self.img10SecFor.isHidden = true
        collectionViewContainer.backgroundColor = .clear
        minimizeButton.isHidden = true
        hidePlayerControls(dontAnimate: true)
        let trueOffset = initialFirstViewFrame!.size.height - 100
        let xOffset = initialFirstViewFrame!.size.width - 160
        
        viewMinimizedFrame!.origin.y = trueOffset - 86
        viewMinimizedFrame!.origin.x = xOffset - 6
        viewMinimizedFrame!.size.width = initialFirstViewFrame!.size.width
        
        playerViewMinimizedFrame!.size.width = self.view.bounds.size.width - xOffset
        playerViewMinimizedFrame!.size.height = playerViewMinimizedFrame!.size.width / (16/9)
        
        if !isMinimise {
            self.collectionViewContainer.alpha = 0.0
            self.transparentView?.alpha = 0.0
        }
    
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.playerView.frame = self.playerViewMinimizedFrame!
            self.customPlayerView.frame =  self.playerViewMinimizedFrame!
            self.view.frame = self.viewMinimizedFrame!
            
            self.collectionViewContainer.alpha = 0.0
            self.transparentView?.alpha = 0.0
            
            self.customPlayerView.backgroundColor = .clear
            self.customPlayerView.layer.borderWidth = .zero
            
        }, completion: { finished in
            self.isMinimized = true
            self.customPlayerView.layer.borderWidth = 1
            self.customPlayerView.layer.borderColor = UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 0.5).cgColor
            
            self.customPlayerView.backgroundColor = .black
            if let playerGesture = self.playerTapGesture {
                self.playerView.removeGestureRecognizer(playerGesture)
            }
            self.playerTapGesture = nil
            self.playerTapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomPlayerViewController.expandViews))
            self.playerView.addGestureRecognizer(self.playerTapGesture!)
            
            self.view.frame.size.height = self.playerView.frame.height
            // FIXME: - Status bar show here
            UIApplication.shared.setStatusBarHidden(false, with: .fade)
        })
    }
    
    @objc func expandViews() {
        if !(isLiveTV ?? false) {
            self.img10SecBack.isHidden = false
            self.img10SecFor.isHidden = false
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.playerView.frame = self.playerViewFrame!
            self.customPlayerView.frame = self.playerViewFrame!
            self.view.frame = self.initialFirstViewFrame!
            self.playerView?.alpha = 1.0
            
            self.collectionViewContainer?.alpha = 1.0
            self.transparentView?.alpha = 1.0
            
            self.customPlayerView.backgroundColor = .clear
            self.customPlayerView.layer.borderWidth = .zero
            
        }, completion: { finished in
            self.customPlayerView.alpha = 1.0
            self.isMinimized = false
            self.minimizeButton.isHidden = false
            self.playerView.removeGestureRecognizer(self.playerTapGesture!)
            self.playerTapGesture = nil
            self.playerTapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomPlayerViewController.showPlayerControlsView))
            self.playerView.addGestureRecognizer(self.playerTapGesture!)
            self.collectionViewContainer.backgroundColor = .black
            self.showPlayerControlsView()
        })
    }
    
    func finishViewAnimated(animated: Bool) {
        if (animated) {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                self.view.frame = CGRectMake(0.0, self.view!.frame.origin.y, self.view!.frame.size.width, self.view!.frame.size.height)
                self.view.alpha = 0.0
                
            }, completion: { finished in
                self.removeViews()
            })
        } else {
            removeViews()
        }
    }
    
    func removeViews() {
        self.view.removeFromSuperview()
        self.customPlayerView?.resetPlayer()
        [customPlayerView, playerView, collectionViewHolder, collectionViewContainer, transparentView, playerControlsView, backPlayerControlsView].forEach { view in
            view?.removeFromSuperview()
        }
        dragViewController = nil
    }
}
