//
//  AlamofireDataSource.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit
import Alamofire

class AlamofireDataSource: RemoteDataSource {
    
    func getAnimals(result: @escaping ((Result<Array<Animal>, Error>) -> Void)) {}
    
    func getPictures(result: @escaping ((Result<Array<Picture>, Error>) -> Void)) {
        AF.request(Router.Photos.getPhotos, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseBody: Array<Picture> = try jsonDecoder.decode(Array<Picture>.self, from: serverResponse.data!) as Array<Picture>
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
    
    func getPictureById(id: Int, result: @escaping ((Result<Picture, Error>) -> Void)) {
        AF.request(Router.Photos.getPhotoById(photoId: id), interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseBody: Picture = try jsonDecoder.decode(Picture.self, from: serverResponse.data!) as Picture
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}
