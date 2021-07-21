//
//  ScreenTwoViewModel.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

class ScreenTwoViewModel: NSObject {
    
    var repository: Repository!
    @objc dynamic var animals: Array<Animal>?
    @objc dynamic var pictures: Array<Picture>?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getAnimals()
        getPictures()
    }
    
    func getAnimals() {
        repository.getAnimals() { result in
            switch result {
            case .success(let animals):
                self.animals = animals
            case .failure(let error):
                break
            }
        }
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
