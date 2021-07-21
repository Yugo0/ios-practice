//
//  PhotoScreenViewModel.swift
//  test1
//
//  Created by Letnja Praksa 5 on 21.7.21..
//

import UIKit

class PhotoScreenViewModel: NSObject {
    
    var repository: Repository
    @objc dynamic var pictures: Array<Picture>?
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func onViewDidLoad(){
        getPictures()
    }
    
    private func getPictures() {
        repository.getPictures() { result in
            switch result {
            case .success(let pictures):
                self.pictures = pictures
            case .failure(let error):
                break
            }
        }
    }
}
