//
//  ScreenOneViewModel.swift
//  test1
//
//  Created by Letnja Praksa 5 on 19.7.21..
//

import UIKit

class ScreenOneViewModel: NSObject {
    
    @objc dynamic var name: String?
    
    func onViewDidLoad() {
        fetchName()
    }
    
    private func fetchName() {
        name = "Luka"
    }
}
