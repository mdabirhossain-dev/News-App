//
//  CustomPlayerViewController.swift
//  AmberIT
//
//  Created by Khaled on 2/10/23.
//


import UIKit

class CustomPlayerViewController: UIViewController {
    @IBOutlet weak var play: UIButton! {
        didSet {
            play.imageView?.tintColor = .white
        }
    }
    @IBOutlet weak var fullscreen: UIButton!
    @IBOutlet weak var collectionViewHolder: UIView!
    @IBOutlet weak var customPlayerView: PlayerView!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var minimizeButton: UIButton!
    @IBOutlet weak var playerControlsView: UIView!
    @IBOutlet weak var backPlayerControlsView: UIView!
    @IBOutlet weak var slider: CustomSlider!
    @IBOutlet weak var progress: CustomProgress!
    @IBOutlet weak var entireTime: UILabel!
    @IBOutlet weak var slashLabel: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var progressIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var img10SecBack: UIImageView! {
        didSet {
            self.img10SecBack.isUserInteractionEnabled = true
            self.img10SecBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap10SecBack)))
        }
    }
    @IBOutlet weak var img10SecFor: UIImageView! {
        didSet {
            self.img10SecFor.isUserInteractionEnabled = true
            self.img10SecFor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap10SecNext)))
        }
    }
    
    private var pictureInPictureManager: PictureInPictureManager?

    var isOpen: Bool = false
    
    var isPlaying: Bool = false
    var isFullscreen: Bool = false
    var dragginSlider: Bool = false
    var isMinimized: Bool = false
    var hideTimer: Timer?
    var currentUrlIndex: Int = 0 {
        didSet {
            if (customPlayerView != nil) {
                // Finish playing all items
                if (currentUrlIndex >= urls?.count ?? .zero) {
                    // Go back to first collectionView item to loop list
                    currentUrlIndex = 0
                    // selectFirstItemOfCollectionView()
                } else {
                    playIndex(index: currentUrlIndex)
                }
            }
        }
    }
    var urls: [NSURL]? {
        didSet {
            if (customPlayerView != nil) {
                currentUrlIndex = 0
            }
        }
    }
    
    var isLiveTV: Bool? {
        didSet {
            guard let isLive = isLiveTV else { return }
            if customPlayerView != nil {
                pictureInPictureManager = PictureInPictureManager(playerLayer:  customPlayerView.playerLayer, isLive: isLive)
                if isLive {
                    [img10SecBack, img10SecFor, slider, progress, entireTime, currentTime, slashLabel].forEach { element in
                        element.isHidden = true
                    }
                    
                } else {
                    [img10SecBack, img10SecFor, slider, progress, entireTime, currentTime, slashLabel].forEach { element in
                        element.isHidden = false
                    }
                }
            }
        }
    }
    var playerControlsFrame: CGRect?
    var playerViewFrame: CGRect?
    var collectionViewContainerFrame: CGRect?
    var playerViewMinimizedFrame: CGRect?
    var customPlayerFrame: CGRect?
    var minimizedPlayerFrame: CGRect?
    var initialFirstViewFrame: CGRect?
    var viewMinimizedFrame: CGRect?
    var restrictOffset: Float?
    var restrictTrueOffset: Float?
    var restictYaxis: Float?
    var transparentView: UIView?
    var onView: UIView?
    var playerTapGesture: UITapGestureRecognizer?
    var panGestureDirection: UIPanGestureRecognizerDirection?
    var touchPositionStartY: CGFloat?
    var touchPositionStartX: CGFloat?
    
    enum UIPanGestureRecognizerDirection {
        case Undefined
        case Up
        case Down
        case Left
        case Right
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayerWithURLs()
        initViews()
        customPlayerView.delegate = self
        deviceOrientationObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateFrames()
    }
    
    private func deviceOrientationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
    }
    
    @objc private func orientationDidChange() {
        let device = UIDevice.current
        
        switch device.orientation {
        case .portrait:
            print("Device is in Portrait orientation")
            if (isFullscreen && !isMinimized) {
                setPlayerToNormalScreen()
            }
        case .portraitUpsideDown:
            print("Device is in Portrait Upside Down orientation")
        case .landscapeLeft:
            print("Device is in Landscape Left orientation")
            if (!isFullscreen && !isMinimized) {
                setPlayerToFullscreen()
            }
        case .landscapeRight:
            print("Device is in Landscape Right orientation")
            if (!isFullscreen && !isMinimized) {
                setPlayerToFullscreen()
            }
        default:
            print("Device orientation is unknown or face up/down")
        }
    }
    
    func initPlayerWithURLs() {
        if (isMinimized) {
            expandViews()
        }
        playIndex(index: currentUrlIndex)
    }
    
    func initViews() {
        self.view.backgroundColor = .clear
        self.view.alpha = 0.0
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(CustomPlayerViewController.panAction))
        playerView.addGestureRecognizer(gesture)
    }
    
    func calculateFrames() {
        self.initialFirstViewFrame = self.view.frame
        self.playerViewFrame = self.playerView.frame
        self.collectionViewContainerFrame = self.collectionViewContainer.frame
        self.playerViewMinimizedFrame = self.playerView.frame
        self.customPlayerFrame = self.customPlayerView.frame
        self.viewMinimizedFrame = self.collectionViewContainer.frame
        self.playerControlsFrame = self.playerControlsView.frame
        
        playerView.translatesAutoresizingMaskIntoConstraints = true
        collectionViewContainer.translatesAutoresizingMaskIntoConstraints = true
        playerControlsView.translatesAutoresizingMaskIntoConstraints = true
        backPlayerControlsView.translatesAutoresizingMaskIntoConstraints = true
        customPlayerView.translatesAutoresizingMaskIntoConstraints = true
        
        collectionViewContainer.frame = self.initialFirstViewFrame!
        self.playerControlsView.frame = self.playerControlsFrame!
        
        transparentView = UIView.init(frame: initialFirstViewFrame!)
        transparentView?.backgroundColor = .black
        transparentView?.alpha = 0.0
        onView?.addSubview(transparentView!)
        
        self.restrictOffset = Float(self.initialFirstViewFrame!.size.width) - 200
        self.restrictTrueOffset = Float(self.initialFirstViewFrame!.size.height) - 180
        self.restictYaxis = Float(self.initialFirstViewFrame!.size.height - playerView.frame.size.height)
    }
    
    @IBAction func minimizeButtonTouched(_ sender: Any) {
        minimizeViews(isMinimise: true)
    }
    
    // MARK: - First Item Selection of CollectionView
    /*
     func selectFirstItemOfCollectionView() {
         let itemToSelect:NSIndexPath = NSIndexPath(row: 0, section: 0)
         
         UIView.animate(withDuration: 0.5, animations: {
             self.collectionView.scrollToItem(at: itemToSelect as IndexPath, at: .top, animated: true)
         })
     }
     */
}
