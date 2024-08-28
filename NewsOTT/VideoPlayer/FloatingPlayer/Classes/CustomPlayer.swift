//
//  CustomPlayer.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//

import UIKit

public struct CustomPlayer {
    public static func initCustomPlayer(url: NSURL) {
        if (dragViewController == nil) {
            dragViewController = CustomPlayerViewController(nibName: "CustomPlayerViewController", bundle: nil)
        }
        dragViewController?.urls = [url]
    }
    
    public static func initCustomPlayer(urls: [NSURL]) {
        if (dragViewController == nil) {
            dragViewController = CustomPlayerViewController(nibName: "CustomPlayerViewController", bundle: nil)
        }
        dragViewController?.urls = urls
    }
    
    public static func showCustomPlayerView(viewController: UIViewController) {
        if dragViewController!.isOpen == false {
            dragViewController!.view.frame = CGRectMake(viewController.view.frame.size.width, viewController.view.frame.size.height, viewController.view.frame.size.width, viewController.view.frame.size.height)
            dragViewController!.view.alpha = 0
            dragViewController!.view.transform = CGAffineTransformMakeScale(0.2, 0.2)
            dragViewController!.onView = viewController.view
            
            UIApplication.shared.keyWindowInConnectedScenes?.addSubview(dragViewController?.view ?? UIView())
            
            UIView.animate(withDuration: 0.5, animations: {
                dragViewController!.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                dragViewController!.view.alpha = 1
                
                dragViewController!.view.frame = CGRectMake(0, 0, UIApplication.shared.keyWindowInConnectedScenes!.bounds.width, UIApplication.shared.keyWindowInConnectedScenes!.bounds.height)
                
                dragViewController!.isOpen = true
            })
        }
    }
    
    public static func add_ViewController(viewController: UIViewController) {
        viewController.view.frame = (dragViewController?.collectionViewHolder.bounds)!
        dragViewController?.collectionViewHolder.addSubview(viewController.view)
        dragViewController?.addChild(viewController)
        viewController.didMove(toParent: dragViewController)
    }
    
    public static func changeURL(url: NSURL) {
        dragViewController?.urls = [url]
    }
    
    public static func changeURLs(urls: [NSURL]) {
        dragViewController?.urls = urls
    }
    
    public static func changeCurrentIndex(index: Int) {
        dragViewController?.currentUrlIndex = index
    }
    
    public static func playIndex(index: Int) {
        dragViewController?.currentUrlIndex = index
        dragViewController?.playIndex(index: index)
        dragViewController?.hidePlayerControls(dontAnimate: true)
    }
    
    public static func getIndex() -> Int {
        return dragViewController!.currentUrlIndex
    }
    
    public static func isOpen() -> Bool {
        return dragViewController?.isOpen == true ? true : false
    }
    
    public static func isLive(isLive: Bool){
         dragViewController?.isLiveTV = isLive
    }
    
    public static func getPlayerViewController() -> UIViewController? {
        return dragViewController
    }
    
    public static func expandView(expand: Bool) {
        if(dragViewController != nil) {
            dragViewController?.expandViews()
        }
    }
    
    public static func finishPlayerView(animated: Bool) {
        if(dragViewController != nil) {
            dragViewController?.isOpen = false
            dragViewController?.finishViewAnimated(animated: animated)
            dragViewController = nil
        }
    }
}

var dragViewController: CustomPlayerViewController?
