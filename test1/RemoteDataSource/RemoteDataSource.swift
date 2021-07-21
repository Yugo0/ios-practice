//
//  RemoteDataSource.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

protocol RemoteDataSource {
    
    func getPictures(result: @escaping ((Result<Array<Picture>, Error>) -> Void))
    func getAnimals(result: @escaping ((Result<Array<Animal>, Error>) -> Void))
    func getPictureById(id: Int, result: @escaping ((Result<Picture, Error>) -> Void))
}
