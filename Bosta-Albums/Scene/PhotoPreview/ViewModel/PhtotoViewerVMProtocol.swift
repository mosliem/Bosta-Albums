//
//  PhtotoPreviewVMProtocol.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 15/12/2024.
//

import Foundation

protocol PhotoViewerVMProtocol {
    var url: Published<String?>.Publisher { get }
    
    func sharePhoto()
}
