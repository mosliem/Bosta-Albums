//
//  UIViewController+ShowLoader.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import UIKit

extension UIViewController {
    
    var loader: LoaderView {
        
        let window = SceneDelegate.keyWindow ?? UIWindow()
        for view in window.subviews where view is LoaderView {
            return view as! LoaderView
        }
        for view in self.view.subviews where view is LoaderView {
            return view as! LoaderView
        }
        return LoaderView.instanceFromNib()
    }
    
    func showAppLoader() {
        let loader = self.loader
        loader.activityIndicator.color = .darkGray
        
        loader.frame = self.view.frame
        loader.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(loader)
        loader.show()

    }
    
    func hideAppLoader() {
        loader.hide()
        self.loader.removeFromSuperview()
    }
    
    
}
