//
//  RemoteDataSourceImplementation.swift
//  test1
//
//  Created by Letnja Praksa 5 on 20.7.21..
//

import UIKit

class RemoteDataSouceImplementation: RemoteDataSource {
    func getPictures(result: @escaping ((Result<Array<Picture>, Error>) -> Void)) {}
    
    
    func getAnimals(result: @escaping ((Result<Array<Animal>, Error>) -> Void)) {
        let arr: Array<Animal> = [Animal(name: "Macka", age: 7, imageUrl: "https://upload.wikimedia.org/wikipedia/commons/3/38/Adorable-animal-cat-20787.jpg"), Animal(name: "Pas", age: 8, imageUrl: "https://images.squarespace-cdn.com/content/v1/583f1c9ce6f2e1563497ce6f/1481860107994-20729NUG7RJAEF5BUNPG/dog-1196646.jpg?format=1500w"), Animal(name: "Zec", age: 6, imageUrl: "https://media.istockphoto.com/photos/rabbit-4-months-old-sitting-against-white-background-picture-id959866606?k=6&m=959866606&s=612x612&w=0&h=N-YB8phayuoRo3Tyie_YuHSq3qyuk3mfGnBEBO04B5g=")]
        
        result(.success(arr))
    }
}
