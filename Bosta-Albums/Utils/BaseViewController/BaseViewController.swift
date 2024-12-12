//
//  BaseViewController.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import Combine
import UIKit
import SwiftMessages

class BaseViewController<ViewModel: BaseViewModelProtocol>: UIViewController {
    
    var cancellable = Set<AnyCancellable>()
    
    var viewModel: ViewModel!
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    
    func bindViewModel() {
        viewModel.errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.showErrorMessage(message)
        }
        .store(in: &cancellable)
        
        viewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadingState in
                self?.showAppLoader()
            }
            .store(in: &cancellable)
        
    }
}

extension BaseViewController {
    
    func showErrorMessage(_ message: String?) {
        guard let message else {
            return
        }
        vibrate(feedbackType: .error)
        showTopSnackBar(theme: .error, message: message)
    }
    
    func showTopSnackBar(theme: Theme, message: String) {
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        
        view.layoutMarginAdditions = UIEdgeInsets(
            top: 20,
            left: 20,
            bottom: 20,
            right: 20
        )
        
        view.titleLabel?.removeFromSuperview()
        view.bodyLabel?.font = .systemFont(ofSize: 14, weight: .semibold)

        view.configureContent( body: message)
        view.button?.isHidden = true
        SwiftMessages.show(view: view)
    }
    
    func vibrate(feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(feedbackType)
    }
}
