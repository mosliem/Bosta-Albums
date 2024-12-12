//
//  LoaderView.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 12/12/2024.
//

import UIKit

class LoaderView: UIView {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    class func instanceFromNib() -> LoaderView {
        return UINib(
            nibName: "LoaderView",
            bundle: nil
        ).instantiate(withOwner: nil, options: nil)[0] as! LoaderView
    }
    
    func show() {
        activityIndicator.startAnimating()
    }
    
    func  showAsBlankView() {
        activityIndicator.isHidden = true
        self.backgroundColor = .clear
    }
    
    func hide() {
        activityIndicator.stopAnimating()
    }
    
}

