//
//  PhotoDetailsScreenViewModel.swift
//  test1
//
//  Created by Letnja Praksa 5 on 21.7.21..
//

import UIKit

class PhotoDetailsScreenViewModel: NSObject {
    
    var repository: Repository
    @objc dynamic var picture: Picture?
    var pictureId: Int!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getPictureById()
    }
    
    private func getPictureById() {
        repository.getPictureById(id: pictureId) { result in
            switch result {
            case .success(let picture):
                self.picture = picture
            case .failure(let error):
                break
            }
        }
    }
}
