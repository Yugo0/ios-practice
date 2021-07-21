//
//  AnimalRepository.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

class RepositoryImplementation: Repository {
    
    var remoteDataSource: RemoteDataSource = RemoteDataSouceImplementation()
    var webRemoteDataSource: RemoteDataSource = AlamofireDataSource()
    
    func getAnimals(result: @escaping ((Result<Array<Animal>, Error>) -> Void)) {
        remoteDataSource.getAnimals(result: result)
    }
    
    func getPictures(result: @escaping ((Result<Array<Picture>, Error>) -> Void)) {
        webRemoteDataSource.getPictures(result: result)
    }
}
