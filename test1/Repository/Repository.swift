//
//  Repository.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

protocol Repository {
    func getAnimals(result: @escaping ((Result<Array<Animal>, Error>) -> Void))
    func getPictures(result: @escaping ((Result<Array<Picture>, Error>) -> Void))
}
