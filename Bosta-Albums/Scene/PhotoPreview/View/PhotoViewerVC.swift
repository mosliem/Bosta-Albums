//
//  PhotoViewerVC.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 15/12/2024.
//

import UIKit
import Combine

class PhotoViewerVC: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: PhotoViewerVMProtocol
    
    init(viewModel: PhotoViewerVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setupPinchGesture()
        setupShareButton()
    }
    
    private func bindViewModel() {
        viewModel.url.sink { [weak self] url in
            guard let url, !url.isEmpty else { return }
            self?.imageView.load(with: url)
        }
        .store(in: &cancellables)
    }
    
    private func setupShareButton() {
        let shareButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem = shareButton
        
        shareButton.tapPublisher.sink { [weak self] _ in
            self?.viewModel.sharePhoto()
        }
        .store(in: &cancellables)
    }
    
    private func setupPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: nil)
        imageView.isUserInteractionEnabled = true // enable user interaction
        imageView.addGestureRecognizer(pinch)
        
        pinch.pinchPublisher.sink { sender in
            sender.view?.transform = (
                sender.view?.transform.scaledBy(
                    x: sender.scale,
                    y: sender.scale
                )
            )!
            sender.scale = 1
        }
        .store(in: &cancellables)
    }
    
}
